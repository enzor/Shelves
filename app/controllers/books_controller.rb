class BooksController < ApplicationController
  # load and authorize for cancan
  load_and_authorize_resource

  def index
    @books = Book.paginate(:all,:include => [:user], 
                           :order => 'created_at DESC', :page => params[:page],:per_page => 5)
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  def show
    @comment = Comment.new(:book => @book)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  def edit
  end


  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(root_url, :notice => "Book was successfully destroyed.") }
      format.xml  { head :ok }
    end
  end
  
  #rating method to rate a book
  
  def rate
    @book = Book.find(params[:id])
    @book.rate_it(params[:rating].to_i,current_user.id)
  end
  
  #Ferret search engine
  
  def search
    @query=params[:query]
    @books = Book.find_with_ferret(@query)
  end
  
end
