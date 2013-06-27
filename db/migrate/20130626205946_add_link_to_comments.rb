class AddLinkToComments < ActiveRecord::Migration
  def change
    add_column :comments, :link, :string
  end
end
