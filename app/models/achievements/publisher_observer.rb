class PublisherObserver < ActiveRecord::Observer
  observe :book
  
  def after_save(book)
    Publisher.award_achievements_for(book.user) if (book.user.books.count > 0)
  end
  
  def after_update(book)
    Publisher.award_achievements_for(book.user) if (book.user.books.count > 0)
  end
end