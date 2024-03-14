class PeesController < ApplicationController
  
  def new
    @child = Child.find(params[:child_id])
    @pee   = Pee.new
  end

  def create
    @child = Child.find(params[:child_id])
    @pee   = Pee.new(pee_params)
    if @pee.save
      redirect_to child_pee_path(id: @pee.id), notice: "登録しました"
    else
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
      redirect_to child_pee_path, notice: "更新しました"
    else
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
