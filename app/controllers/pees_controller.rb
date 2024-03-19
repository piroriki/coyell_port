class PeesController < ApplicationController
  
  def new
    @child = Child.find(params[:child_id])
    @pee   = Pee.new
  end

  def create
    @child = Child.find(params[:child_id])
    @pee   = Pee.new(pee_params)
    if @pee.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_pee_path(id: @pee.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @pee   = Pee.find(params[:id])
  end

  def update
    @child = Child.find(params[:child_id])
    @pee   = Pee.find(params[:id])
    if @pee.update(pee_params)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_pee_path(id: @pee.id)
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @child = Child.find(params[:child_id])
    @pee   = Pee.find(params[:id])
  end

  def destroy
    @child = Child.find(params[:child_id])
    @pee   = Pee.find(params[:id])
    @pee.destroy
    redirect_to children_path, notice: "削除しました"
  end

  private

    def pee_params
      params.require(:pee).permit(:time, :memo).merge(child_id: params[:child_id])
    end
    
end
