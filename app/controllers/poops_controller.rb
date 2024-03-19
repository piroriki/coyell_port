class PoopsController < ApplicationController

  def new
    @child = Child.find(params[:child_id])
    @poop  = Poop.new
  end

  def create
    @child = Child.find(params[:child_id])
    @poop  = Poop.new(poop_params)
    if @poop.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_poop_path(id: @poop.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
      render :new, status: unprocessable_entity
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @poop  = Poop.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @poop  = Poop.find(params[:id])
    if @poop.update(poop_params)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_poop_path
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @poop  = Poop.find(params[:id])
    @poop.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child = Child.find(params[:child_id])
    @poop  = Poop.find(params[:id])
  end

  private
    
    def poop_params
      params.require(:poop).permit(:time, :memo).merge(child_id: params[:child_id])
    end
end
