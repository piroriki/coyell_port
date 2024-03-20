class ChatsController < ApplicationController

  # Aさん(自分)、Bさん(相手)のデータを同時に定義していく
  def show
    # Bさんのユーザー情報を取得する
    @user               = User.find(params[:id])
    # user_room_relationsテーブルのuser_idが、
    # Aさんのレコードであるchat_room_idを配列で取得する
    chat_rooms          = current_user.user_chat_rooms.pluck(:room_id)
    # AさんとBさん共通のchat_room_idが存在すれば、共通のchat_room_idとBさんのuser_idが
    # user_room_relationsの変数に格納される(存在しなければnilを返す)
    user_room_relations = UserRoomRelation.find_by(user_id: @user.id, chat_room_id: chat_rooms)
    #　AさんとBさんのルームが存在しなかった場合の処理
    chat_room           = nil
 
    if user_room_relations.nil?
      # 共通のチャットルームがなければ、新たに作成する
      @chat_room        = ChatRoom.new
      # 2人分のチャットルーム情報を保存する
      @chat_room.save
      # Bさん用
      UserRoomRelation.create(user_id: @user.id,        chat_room_id: @chat_room.id)
      # Aさん用
      UserRoomRelation.create(user_id: current_user.id, chat_room_id: @chat_room.id)    
    else
      # 既に存在する場合は、user_room_relationsに紐づいたチャットルーム情報をインスタンスに格納する
      @chat_room        = user_room_relations.chat_room
    end
    
    # ＠chat_roomに紐づくチャットのレコードを、@chatsに格納する
    @chats              = @chat_room.chats
    # chatモデルでインスタンス作成する際にchat_room_idを渡す
    # (form_withでchat_room_idが渡らなくなるため)
    @chat               = Chat.new(chat_room_id: @chat_room.id)
  end

  def create
    @chat               = current_user.chats.new(chat_params)
    @chat.save
  end

  private

    def chat_params
      params.require(:chat).permit(:message, :chat_room_id)
    end
end

