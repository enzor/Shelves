class RatingsController < ApplicationController
  
  #rating controller
  def rate
    @book = Book.find(params[:id]) #first find the book
    Rating.delete_all(["rateable_type = 'Book' AND rateable_id = ? AND user_id = ?", 
      @book.id, current_user.id]) #then delete the last rating of this user on this book
    @book.add_rating Rating.new(:rating => params[:rating], 
      :user_id => current_user.id) # add the new rating
  end
end