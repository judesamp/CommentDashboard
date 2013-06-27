require 'spec_helper'

describe "Home Page" do
  describe "Get /" do
    context 'empty database' do
      before(:each) do
        visit '/'
      end
  
      it "renders success" do
        expect(page.status_code).to be(200)
      end
      
      it "populates title" do
        expect(page).to have_title 'Comments Dashboard'
      end
      
      describe "masthead" do
        it "displays title" do
          expect(page).to have_selector "h1", text:'Comments Dashboard'
        end
        
        it "displays subtitle" do
          expect(page).to have_selector "h2", text: "Read comments from your favorite blogs."
        end
        
      end
      
      context 'populated database' do
        
        fixtures :blogs
        
        before(:each) do
          visit '/'
        end
        
        it "shows a list of blogs" do
          expect(page).to have_selector "li a", text: "Mashable"
        end
      end
      
    end
  end
  
  describe "POST /blogs" do
    before :each do
      stub_network
      
      visit '/'
      fill_in "Blog title", with:"Example"
      fill_in "Comments feed url", with:"http://example.com/comments/feed"
      click_on "Create"
    end
    
    let(:blog) {Blog.find_by_permalink 'example'}
    
    it "creates a valid record" do
      expect(blog).to be_valid
    end
    
    it "preloads comments" do
      expect(blog.comments.length).to eq 30
    end
    
  end
  
  
end