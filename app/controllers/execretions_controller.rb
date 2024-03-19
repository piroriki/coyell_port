class ExecretionsController < ApplicationController

  def new
    @child      = Child.find(params[:child_id])
    @execretion = Execretion.new
  end

  def create
    @child      = Child.find(params[:child_id])
    @execretion = Execretion.new(execretion_params)
    if @execretion.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_execretion_path(id: @execretion.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child      = Child.find(params[:child_id])
    @execretion = Execretion.find(params[:id])
  end

  def update
    @child      = Child.find(params[:child_id])
    @execretion = Execretion.find(params[:id])
    if @execretion.update(execretion_params)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_execretion_path(id: @execretion.id)
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @execretion = Execretion.find(params[:id])
    @execretion.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child      = Child.find(params[:child_id])
    @execretion = Execretion.find(params[:id])
  end

  private

    def execretion_params
      params.require(:execretion).permit(:time, :memo).merge(child_id: @child.id)
    end
end
