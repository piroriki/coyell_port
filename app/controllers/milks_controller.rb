class MilksController < ApplicationController

  def new
    @child = Child.find(params[:child_id])
    @milk  = Milk.new
  end

  def create
    @child = Child.find(params[:child_id])
    @milk  = Milk.new(milk_params)
    if @milk.save
      redirect_to child_milk_path(id: @milk.id), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @milk  = Milk.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @milk  = Milk.find(params[:id])
    if @milk.update(milk_params)
      redirect_to child_milk_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @milk  = Milk.find(params[:id])
    @milk.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child = Child.find(params[:child_id])
    @milk  = Milk.find(params[:id])
  end

  private

    def milk_params
      params.require(:milk).permit(:amount, :time, :memo).merge(child_id: params[:child_id])
    end
end
