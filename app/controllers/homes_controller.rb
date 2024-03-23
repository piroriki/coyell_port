class HomesController < ApplicationController
  def top
  end

  def record
    @children = Child.all
    @heights  = Height.all
    @diaries  = Diary.all
    @diary_tags = DiaryTag.all
    #@mixed_array = @height
    #@mixed_array.sort{ |f,s| f.created_at <=> s.created_at }
  end

end
