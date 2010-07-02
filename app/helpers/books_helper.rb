module BooksHelper
  def rate(obj)
    output_str = ""
    1..6.times  do |n|
      output_str += " "
      output_str += link_to_remote(n.to_s,{:url => {:controller => 'books',:action => 'rate',:id => obj.id, :rating => n }})
      output_str += " |"
    end
    return output_str.chop
  end
end
