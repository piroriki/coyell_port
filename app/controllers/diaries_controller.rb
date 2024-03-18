class DiariesController < ApplicationController

  def new
    @child    = Child.find(params[:child_id])
    @diary    = Diary.new
  end

  def create
    @child    = Child.find(params[:child_id])
    @diary    = Diary.new(diary_params)
    tag_names  = params[:diary][:tag_names]
    if @diary.save
      # tag_namesにタグがあれば、一つずつに分割する
      if tag_names.present?
        tags = tag_names.split("\n").map(&:strip).uniq
        create_or_update_diary_tags(@diary, tags)
      end
      flash[:success] = t("dictionary.messages.diary.created")
      redirect_to diaries_path
    else
      flash[:danger]  = t("dictionary.messages.diary.not_created")
      render :new
    end
  end

  def edit
    @child    = Child.find(params[:child_id])
    @diary    = Diary.find(params[:id])
  end

  def update
    @child    = Child.find(params[:child_id])
    @diary    = Diary.find(params[:id])
    # :diaryで預かったパラメータにアクセスし、:tag_idを取得する
    tag_names  = params[:diary][:tag_names]
    if @diary.update(diary_params)
      if tag_names.present?
        tags = params[:diary][:tag_names].split("\n").map(&:strip).uniq
        create_or_update_diary_tags(@diary, tags)
      end
      flash[:success] = t("dictionary.messages.updated")
      redirect_to diaries_path
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit
    end
  end

  def destroy
    @diary    = Diary.find(params[:id])
    @diary.destroy
    flash[:success] = t("dictionary.messages.destroyed")
    redirect_to diaries_path
  end

  def show
    @child = Child.find(params[:child_id])
    @diary = Diary.find(params[:id])
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :content, :photo)
    end

    def create_or_update_diary_tags(diary, tags)
      # 古いタグが残らないよう、現在のタグを全て削除する
      diary.tags.destroy_all
      begin
      tags.each do |tag|
        # 既存のタグがあれば既存のレコードから取得し、なけれヴァ新たに作成する
        tag = DiaryTag.find_or_create_by(name: tag)
        diary.tags << tag
        rescue ActiveRecord::RecordInvalid
          false
        end
      end
    end
end
