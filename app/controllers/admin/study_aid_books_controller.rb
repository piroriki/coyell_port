class Admin::StudyAidBooksController < ApplicationController

  def index
    @admin = current_user
    @study_aid_books = StudyAidBook.all
  end

  def new
    @study_aid_book = current_user.study_aid_books.new
  end

  def create
    @study_aid_book = current_user.study_aid_books.new(study_aid_book_params)
    if @study_aid_book.save
      flash[:success] = "投稿が完了しました"
      redirect_to admin_study_aid_books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @admin = current_user
    @study_aid_book = StudyAidBook.find(params[:id])
  end

  def update
    @admin = current_user
    @study_aid_book = StudyAidBook.find(params[:id])
    if @study_aid_book.update(study_aid_book_params)
      flash[:success] = "編集が完了しました"
      redirect_to admin_study_aid_books_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @admin = current_user
    @study_aid_book = StudyAidBook.find(params[:id])
  end

  def destroy
    @study_aid_book = StudyAidBook.find(params[:id])
    @study_aid_book.destroy
    flash[:success] = "削除が完了しました"
    redirect_to admin_study_aid_books_path
  end

  private  
    
    def study_aid_book_params
      params.require(:study_aid_book).permit(:title, :content, :image)
    end
end
