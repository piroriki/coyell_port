class MealsController < ApplicationController

  def new
    @child = Child.find(params[:child_id])
    @meal  = Meal.new
    @kinds_options = Meal.kinds_i18n.invert.map{|key,value|[key,value]}
  end

  def create
    @child = Child.find(params[:child_id])
    @meal  = Meal.new(meal_params)
    if @meal.save
      redirect_to child_meal_path(id: @meal.id), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @meal  = Meal.find(params[:id])
    @kinds_options = Meal.kinds_i18n.invert.map{|key,value|[key,value]}
  end

  def update
    @child = Child.find(params[:child_id])
    @meal  = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to child_meal_path(id: @meal.id), notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal  = Meal.find(params[:id])
    @meal.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child = Child.find(params[:child_id])
    @meal  = Meal.find(params[:id])
  end

  private

    def meal_params
      params.require(:meal).permit(:kinds, :time, :memo).merge(child_id: params[:child_id])
    end
end
