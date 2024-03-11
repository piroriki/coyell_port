class HeightsController < ApplicationController

  def new
    @height = Height.new
  end

  def create
    @height = Height.new(height_params)
    if @height.save
      redirect_to child_height_path(@child), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @height = Height.find(params[:id])
  end

  def update
    @height = Height.find(params[:id])
    if @height.update(height_params)
      redirect_to child_height_path(@height), notice: "更新しました"
    else
      render :edit, status: :unproccesable_entity
    end
  end

  def show
    @height = Height.find(params[:id])
  end

  def destroy
    @height = Height.find(params[:id])
    @height.destroy
    redirect_to children_path, notice: "削除しました"
  end

  private

    def height_params
      params.require(:height).permit(:height).merge(user_id: current_user.id)
    end
    
end
