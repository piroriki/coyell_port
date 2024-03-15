class RightBreastMilksController < ApplicationController
  def new
    @child = Child.find(params[:child_id])
    @r_breast_milk = RightBreastMilk.new
  end

  def create
    @child = Child.find(params[:child_id])
    @r_breast_milk = RightBreastMilk.new(r_breast_milk_params)
    if @r_breast_milk.save
      redirect_to child_right_breast_milk_path(id: @r_breast_milk.id), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @r_breast_milk = RightBreastMilk.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @r_breast_milk = RightBreastMilk.find(params[:id])
    if @r_breast_milk.update(r_breast_milk_params)
      redirect_to child_right_breast_milk_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @r_breast_milk = RightBreastMilk.find(params[:id])
    @r_breast_milk.destroy
    redirect_to children_path, notice: "削除しました"
  end
  
  private

    def r_breast_milk_params
      params.require(:right_breast_milk).permit(:time, :memo).merge(child_id: params[:child_id])
    end
end
