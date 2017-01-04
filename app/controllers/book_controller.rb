class BookController < ApplicationController
def list
render layout: "standard"
@books = Book.all
end
def show
render layout: "standard"

@book = Book.find(params[:id])
end
def new
render layout: "standard"

@book=Book.new
@subjects=Subject.all
end

 def book_params 
    params.require(:books).permit(:title, :price, :subject_id, :description) 
  end  
  def create 
  

    @book = Book.new(book_params)  
    if @book.save 
      redirect_to :action => 'list' 
    else 
      @subjects = Subject.all() 
      render :action => 'new' 
    end 
  end  
  def edit
render layout: "standard"
  
    @book = Book.find(params[:id])  
    @subjects = Subject.all 
  end 
   
  def book_param 
    params.require(:book).permit(:title, :price, :subject_id, :description) 
  end  
def update

 
    @book = Book.find(params[:id]) 
     
    if @book.update_attributes(book_param) 
      redirect_to :action => 'show', :id => @book 
    else 
      @subjects = Subject.all 
      render :action => 'edit' 
    end 
end	

def delete


if(Book.find(params[:id]).destroy)
redirect_to :action =>"list"
end
end
def show_subjects
render layout: "standard"

@subject=Subject.find(params[:id])
end
end
