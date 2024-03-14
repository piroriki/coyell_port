class TemperaturesController < ApplicationController

  def new
    @child       = Child.find(params[:child_id])
    @temperature = Temperature.new
  end

  def create
    @child       = Child.find(params[:child_id])
    @temperature = Temperature.new(temperature_params)
    if @temperature.save
      redirect_to child_temperature_path(id: @temperature.id), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child       = Child.find(params[:child_id])
    @temperature = Temperature.find(params[:id])
  end

  def update
    @child       = Child.find(params[:child_id])
    @temperature = Temperature.find(params[:id])
    if @temperature.update(temperature_params)
      redirect_to child_temperature_path(id: @temperature.id), notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @child       = Child.find(params[:child_id])
    @temperature = Temperature.find(params[:id])
  end

  def destroy
    @temperature = Temperature.find(params[:id])
    @temperature.destroy
    redirect_to children_path, notice: "削除しました" 
  end

  private

    def temperature_params
      params.require(:temperature).permit(:time, :temperature, :memo).merge(child_id: params[:child_id])
    end
end
