class BooksController < ApplicationController

  def  top
  end

  def new

     @book = Book.new

  end

 def create
        # ストロングパラメーターを使用
         @book = Book.new(book_params)
         if @book.save
          flash[:notice] ="successfully"
        redirect_to book_path(@book)
      else
        render :index

      end
  end







def index
	@books = Book.all
  @book = Book.new
end

def edit
        @book = Book.find(params[:id])
 end

def show
  @book = Book.find(params[:id])

end

def update
  @book = Book.find(params[:id])
    @book.update(book_params)
 if @book.save
 flash[:notice] ="successfully"
 redirect_to book_path(@book)
 else
 render :index

end
end

  def destroy
          book = Book.find(params[:id])
          book.destroy
          redirect_to books_path


        end



 private
 def book_params
	params.require(:book).permit(:title, :body)

 end

end


