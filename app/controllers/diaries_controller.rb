class DiariesController < ApplicationController

  def new
    @child    = Child.find(params[:child_id])
    @diary    = Diary.new
  end

  def create
    @child    = Child.find(params[:child_id])
    @diary    = Diary.new(diary_params)
    tag_list  = params[:diary][:tag_id].split(",")
    if @diary.save
      # @diaryにsave_diary_tagsを渡し、引数としてタグも同時に保存させる
      @diary.save_tags(tags)
      redirect_to diaries_path, notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
    @child    = Child.find(params[:child_id])
    @diary    = Diary.find(params[:id])
    @tag_list = @diary.tag_list.pluck(:name).join(",")
  end

  def update
    @child    = Child.find(params[:child_id])
    @diary    = Diary.find(params[:id])
    # :diaryで預かったパラメータにアクセスし、:tag_idを取得する
    tag_list  = params[:diary][:tag_id].split(",")
    if @diary.update(diary_params)
      @diary.update_tags(tags)
      redirect_to diaries_path, success: t("diaries.edit.edit_success")
    else
      render :edit
    end
  end

  def destroy
    @diary    = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path, success: t("diaries.destroy.destroy_sucess")
  end

  def show
    @child = Child.find(params[:child_id])
    @diary = Diary.find(params[:id])
    # タグ用
    @tags  = @diary.tags.pluck(:name).join(",")
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :content, :photo)
    end
end
