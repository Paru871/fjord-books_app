# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_book
  before_action :set_commentable_render

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_commentable_render
    @commentable_render = 'books/show'
  end
end
