require 'spec_helper'

describe Comment do
  let(:xml) { File.read(File.join('spec', 'fixures', 'feed.xml')) }
  
  describe "attributes" do
    
    
    
    let(:comment) {Comment.new( title:"My Comment",
                                link: "",
                                commenter: "Commenter Name",
                                description: "What in the world are you talking about?")
                  }

    it {expect(comment).to validate_uniqueness_of  :link}
  end
end
