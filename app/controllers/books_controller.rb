class BooksController < ApplicationController
    def index
        @books = Book.all
        @new_book = Book.new
        @users = User.all
    end

    def show
        @book = Book.find(params[:id])
        @new_book = Book.new
        @user = @book.user
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user == current_user
            render "edit"
        else
            redirect_to books_path
        end
    end

    def create
        @new_book = Book.new(book_params)
        @new_book.user_id = current_user.id
        if @new_book.save
            redirect_to book_path(@new_book.id), notice: 'You have created book successfully.'
        else
            @books = Book.all
            render :index
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
        else
            render :edit
        end

    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private

    def book_params
         params.require(:book).permit(:title, :body, :user_id)
    end

end
