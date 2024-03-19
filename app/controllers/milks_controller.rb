class MilksController < ApplicationController

  def new
    @child = Child.find(params[:child_id])
    @milk  = Milk.new
  end

  def create
    @child = Child.find(params[:child_id])
    @milk  = Milk.new(milk_params)
    if @milk.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_milk_path(id: @milk.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
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
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_milk_path
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
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
