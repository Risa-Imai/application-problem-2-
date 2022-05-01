class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    #render :create
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new    
    book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    book_comment.destroy
    #refroute = Rails.application.routes.recognize_path(request.referer)
    #@book = Book.find(refroute[:id])
    #@book = Book.find(params[:book_id])
    #@book_comment = BookComment.new
    #BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    #render :destroy
    #redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
