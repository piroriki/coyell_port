class BathsController < ApplicationController

  def new
    @child = Child.find(params[:child_id])
    @bath  = Bath.new
  end

  def create
    @child = Child.find(params[:child_id])
    @bath  = Bath.new(bath_params)
    if @bath.save
      redirect_to child_bath_path(id: @bath.id), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @bath  = Bath.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @bath  = Bath.find(params[:id])
    if @bath.update(bath_params)
      redirect_to child_bath_path(id: @bath.id), notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bath  = Bath.find(params[:id])
    @bath.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child = Child.find(params[:child_id])
    @bath  = Bath.find(params[:id])
  end

  private

    def bath_params
      params.require(:bath).permit(:time, :memo).merge(child_id: @child.id)
    end
end
