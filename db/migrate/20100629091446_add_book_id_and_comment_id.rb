class AddBookIdAndCommentId < ActiveRecord::Migration
  def self.up
    add_column :books, :comment_id, :integer
    add_column :comments, :book_id, :integer
  end

  def self.down
    remove_column :books, :comment_id
    remove_column :comments, :book_id
  end
end
