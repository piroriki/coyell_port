class ChildrenController < ApplicationController
  
  def index
    @child = Children.all
  end

  def show
    @child = Child.find_by(id: params[:id])
  end

  def edit
    @child = Child.find_by(id: params[:id])
  end

  def update
    @child = Child.update(child_params)
    if @child.save
      redirect_to child_path, notice: "更新完了しました"
    else
      render :edit, status: :unproccesable_entity
    end
  end

  def new
    @child = Child.new(child_params)
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to child_path, notice: "登録しました"
    else
      render :new, status: :unproccesable_entity
    end
  end

  private
 
    # ストロングパラメータ
    def child_params
      params.require(:child).permit(:name, :gender, :age, :birthday).merge(user_id: current_user.id)
    end

end
