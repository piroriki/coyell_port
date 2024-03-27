class Admin::StudyAidBooksController < ApplicationController

  def new
    @admin = User.find(params[:id])
    if @admin.admin?
      @study_aid_book.new
    else
      redirect_to root_path
      flash[:danger] = "管理者権限がありません"
    end
  end

  def create
    @admin = User.find(params[:id])
    if @admin.admin?
      @study_aid_book.new(study_aid_book_params)
      if @study_aid_book.save
        flash[:success] = "投稿が完了しました"
        redirect_to admin_study_aid_books_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to root_path
      flash[:danger] = "管理者権限がありません"
    end
  end

  def edit
    @admin = User.find(params[:id])
    if @admin.admin?
      @study_aid_book = StudyAidBook.find(params[:id])
    else
      redirect_to root_path
      flash[:danger] = "管理者権限がありません"
    end
  end

  def update
    @admin = User.find(params[:id])
    if @admin.admin?
      @study_aid_book = StudyAidBook.find(params[:id])
      if @study_aid_book.update(study_aid_book_params)
        flash[:success] = "編集が完了しました"
        redirect_to admin_study_aid_books_path
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
      flash[:danger] = "管理者権限がありません"
    end
  end

  def show
    @admin = User.find(params[:id])
    if @admin.admin?
      @study_aid_book = StudyAidBook.find(params[:id])
    else
      flash[:danger] = "管理者権限がありません"
      redirect_to root_path
    end
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
