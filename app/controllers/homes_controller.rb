class HomesController < ApplicationController
  def top
  end

  def record
    @child = Child.find(params[:child_id])
    @heights = Height.all
    #@mixed_array = @height
    #@mixed_array.sort{ |f,s| f.created_at <=> s.created_at }
  end

end
