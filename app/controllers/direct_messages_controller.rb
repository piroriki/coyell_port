class DirectMessagesController < ApplicationController

  def show
    # 相手のユーザー情報を取得
    @user = User.find(params[:id])
    # entriesで、自分が保持するroom_idを全て取得する
    entries = current_user.entries.pluck(:room_id)
    # 相手と自分で共通のルームを持っているか確認する
    user_rooms = Entry.find_by(user_id: @user.id, room_id: entries)
   
    if user_rooms.nil?
      # 共通のルームがなければ、新たに作成する
      @room = Room.new
      @room.save
      Entry.create(user_id: @user.id, room_id: @room.id)
      Entry.create(user_id: current_user.id, room_id: @room.id)
    else
      #共通のルームがあれば、@roomに変数として格納する
      @room = user_rooms.room
    end
   
    # @roomに紐づくdirect_messageのデータを、インスタンスとして格納する
    @direct_messages = @room.direct_messages
    # room.idを格納することで、form_withで渡すid指定ができる
    @direct_message = DirectMessage.new(room_id: @room.id)
  end
   
  def create
    @direct_message = current_user.direct_messages.new(direct_message_params)
    @direct_message.save
  end

  def destroy
    # ログイン中のユーザーに関するチャットメッセージを削除
    @direct_message = current_user.direct_messages.find(params[:id])
    @direct_message.destroy
  end
   
   private
   
    def direct_message_params
      params.require(:direct_message).permit(:message, :room_id)
    end
  end
   