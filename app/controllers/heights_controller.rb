class HeightsController < ApplicationController

  # ネストしたモデルのため、
  # 親モデルであるchildのインスタンスを各メソッド内に設定する

  def new
    @child  = Child.find(params[:child_id])
    @height = Height.new
  end

  def create
    @child  = Child.find(params[:child_id])
    @height = Height.new(height_params)
    if @height.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_height_path(id: @height.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child  = Child.find(params[:child_id])
    @height = Height.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @height = Height.find(params[:id])
    if @height.update(height_params)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_height_path(id: @height.id)
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unproccesable_entity
    end
  end

  def show
    @child  = Child.find(params[:child_id])
    @height = Height.find(params[:id])
  end

  def destroy
    @height  = Height.find(params[:id])
    @height.destroy
    flash[:success] =  "削除しました"
    redirect_to children_path, status: :see_other
  end

  private

    def height_params
      params.require(:height).permit(:height).merge(child_id: params[:child_id])
    end

end
