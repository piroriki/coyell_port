class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      # Entry内のuser_idがcurrent_userと同じ場合
      @currentUserEntry = Entry.where(user_id: current_user.id)
      # Entry内のuser_idがparams.idを同じ場合
      @userEntry        = Entry.where(user_id: @user.id)
      # @user.idとcurrent_user.idが同じでなければ
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            # current_userと@userで、同一のroom_idがあれば
            # 存在するルームに入室する
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        # 同一のルームが存在しなければ、roomとentryを新たに作成する
        unless @isRoom
          @room  = Room.new
          @entry = Entry.new
        end
      end
    end
  end
end
