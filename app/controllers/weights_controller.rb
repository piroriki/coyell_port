class WeightsController < ApplicationController

  def new
    @child  = Child.find(params[:child_id])
    @weight = Weight.new
  end

  def create
    @child  = Child.find(params[:child_id])
    @weight = Weight.new(weight.params)
    if @weight.save(weight_params)
      redirect_to child_weight_path(id: @weight.id), notice: "登録しました"
    else
      render :new, status: :unproccesable_entity
    end
  end

  def edit
    @child  = Child.find(params[:child_id])
    @weight = Weight.find(params[:id])
  end

  def update
    @child  = Child.find(params[:child_id])
    @weight = Weight.find(params[:id])
    if @weight.update(weight_params)
      redirect_to child_weight_path, notice: "更新しました"
    else
      render :edit, status: :unproccesable_entity
    end
  end

  def show
    @child  = Child.find(params[:child_id])
    @weight = Weight.find(params[:id])
  end

  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy
    redirect_to children_path, notice: "削除しました"
  end

  private

    def weight_params
      params.require(:weight).permit(:weight).merge(child_id: params[:child_id])
    end

  end
end
