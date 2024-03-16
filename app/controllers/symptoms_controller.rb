class SymptomsController < ApplicationController

  def new
    @child   = Child.find(params[:child_id])
    @symptom = Symptom.new
    @kinds_options = Symptom.kinds_i18n.invert.map{|key,value|[key,value]}
  end

  def create
    @child   = Child.find(params[:child_id])
    @symptom = Symptom.new(symptom_params)
    if @symptom.save
      redirect_to child_symptom_path, notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @child   = Child.find(params[:child_id])
    @symptom = Symptom.find(params[:id])
    @kinds_options = Symptom.kinds_i18n.invert.map{|key,value|[key,value]}
  end

  def update
    @child   = Child.find(params[:child_id])
    @symptom = Symptom.find(params[:id])
    if @symptom.update(symptom_params)
      redirect_to child_symptom_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy
    redirect_to children_path, notice: "削除しました"
  end

  def show
    @child   = Child.find(params[:child_id])
    @symptom = Symptom.find(params[:id])
  end

  private

    def symptom_params
      params.require(:symptom).permit(:kinds, :time, :memo).merge(child_id: params[:child_id])
    end
end
