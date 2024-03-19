class LeftBreastMilksController < ApplicationController
  
  def new
    @child         = Child.find(params[:child_id])
    @l_breast_milk = LeftBreastMilk.new
  end

  def create
    @child         = Child.find(params[:child_id])
    @l_breast_milk = LeftBreastMilk.new(l_breast_milk_params)
    if @l_breast_milk.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_left_breast_milk_path(id: @l_breast_milk.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
      render new, status: :unprocessable_entity
    end
  end

  def edit
    @child         = Child.find(params[:child_id])
    @l_breast_milk = LeftBreastMilk.find(params[:id])
  end

  def update
    @child         = Child.find(params[:child_id])
    @l_breast_milk = LeftBreastMilk.find(params[:id])
    if @l_breast_milk.update(l_breast_milk_params)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_left_breast_milk_path(id: @l_breast_milk.id)
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @l_breast_milk = LeftBreastMilk.find(params[:id])
    @l_breast_milk.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child         = Child.find(params[:child_id])
    @l_breast_milk = LeftBreastMilk.find(params[:id])
  end

  private

    def l_breast_milk_params
      params.require(:left_breast_milk).permit(:time, :memo).merge(child_id: params[:child_id])
    end
end
