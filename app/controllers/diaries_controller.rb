class DiariesController < ApplicationController

  def new
    @child     = Child.find(params[:child_id])
    @diary     = Diary.new
  end

  def create
    @child     = Child.find(params[:child_id])
    @diary     = Diary.new(diary_params)
     # 受け取ったタグを","で区切って配列にする
    tag_list = params[:diary][:name].split(',')
    if @diary.save
      @diary.save_diary_tags(tag_list)
      flash[:success]   = t("dictionary.messages.diary.created")
      redirect_to child_diary_path(id: @diary.id)
    else
      flash[:danger]    = t("dictionary.messages.diary.not_created")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child     = Child.find(params[:child_id])
    @diary     = Diary.find(params[:id])
    @tag_list  = @diary.diary_tags.pluck(:name).join(",")
  end

  def update
    @child     = Child.find(params[:child_id])
    @diary     = Diary.find(params[:id])
    # :diaryで預かったパラメータにアクセスし、:tag_idを取得する
    tag_list  = params[:diary][:name].split(",")
    if @diary.update(diary_params)
      @diary.save_diary_tags(tag_list)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_diary_path(id: @diary.id)
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary      = Diary.find(params[:id])
    @diary.destroy
    flash[:success] = t("dictionary.messages.destroyed")
    redirect_to diaries_path
  end

  def show
    @child      = Child.find(params[:child_id])
    @diary      = Diary.find(params[:id])
    @tag_list   = @diary.diary_tags.pluck(:name).join(",")
    @diary_tags = @diary.diary_tags
  end

  def search_tag
    # 検索結果画面でもタグ一覧表示
    @tag_list = DiaryTag.all
    # 検索されたタグを受け取る変数を設定
    @tag      = DiaryTag.find(params[:diary_tag_id])
    # 検索されたタグに紐づく日記を表示
    @diaries  = @tag.diaries
  end

  def index
    @diaries  = Diary.all
    @tag_list = DiaryTag.all
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :content, :photo, :name => []).merge(child_id: @child.id)
    end

    def create_or_update_diary_tags(diary, tags)
      # 古いタグが残らないよう、現在のタグを全て削除する
      diary.tags.destroy_all
      begin
      tags.each do |tag|
        # 既存のタグがあれば既存のレコードから取得し、なければ新たに作成する
        tag = DiaryTag.find_or_create_by(name: tag)
        diary.tags << tag
        rescue ActiveRecord::RecordInvalid
          false
        end
      end
    end
end
