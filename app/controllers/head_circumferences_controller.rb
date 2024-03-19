class HeadCircumferencesController < ApplicationController

  def new
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.new
  end

  def create
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.new(head_circumference_params)
    if @head_circumference.save
      flash[:success] = t("dictionary.messages.created")
      redirect_to child_head_circumference_path(id: @head_circumference.id)
    else
      flash[:danger]  = t("dictionary.messages.not_created")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.find(params[:id])
  end

  def update
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.find(params[:id])
    if @head_circumference.update(head_circumference_params)
      flash[:success] = t("dictionary.messages.updated")
      redirect_to child_head_circumference_path(id: @head_circumference.id)
    else
      flash[:danger]  = t("dictionary.messages.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @head_circumference = HeadCircumference.find(params[:id])
    @head_circumference.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.find(params[:id])
  end

  private

    def head_circumference_params
      params.require(:head_circumference).permit(:time, :length, :memo).merge(child_id: params[:child_id])
    end
end
