require 'spec_helper'

describe "Blogs detail" do
  describe "Get /blogs/:id" do
    
    fixtures :blogs
    
      before(:each) do
        blog = blogs(:mashable)
        Factory.create_comments blog
        visit '/blogs/mashable'
      end
      
      
      it "responds with success" do
        expect(page.status_code).to be(200)
      end
      
      describe "individual content" do
        
        it "renders a link to the comment" do
          link_text = "Comment on The Earliest Photos of Apple’s iPad Hit the Web by Fido"
          expect(page).to have_selector "div.comment p a", text:link_text
        end
        
        
      end
      
      
  end
end