class HeadCircumferencesController < ApplicationController

  def new
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.new
  end

  def create
    @child              = Child.find(params[:child_id])
    @head_circumference = HeadCircumference.new(head_circumference_params)
    if @head_circumference.save
      redirect_to child_head_circumference_path(id: @head_circumference.id), notice: "登録しました"
    else
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
      redirect_to child_head_circumference_path(id: @head_circumference.id), notice: "更新しました"
    else
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
