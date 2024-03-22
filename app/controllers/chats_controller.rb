class ChatsController < ApplicationController

  def show
    # 相手のユーザー情報を取得する
    @user               = User.find(params[:id])
    # 自分に紐づくchat_room_idを全て取得する
    chat_rooms          = current_user.user_chat_rooms.pluck(:room_id)
    # 相手と共通のchat_roomをもつか確認
    user_room_relations = UserRoomRelation.find_by(user_id: @user.id, chat_room_id: chat_rooms)
    # もし存在しなければnilを返す
    # chat_room = nil
 
    if user_room_relations.nil?
      # 共通のチャットルームがなければ、新たに作成する
      @chat_room        = ChatRoom.new
      # 2人分のチャットルーム情報を保存する
      @chat_room.save
      # 相手用
      UserRoomRelation.create(user_id: @user.id,        chat_room_id: @chat_room.id)
      # 自分用
      UserRoomRelation.create(user_id: current_user.id, chat_room_id: @chat_room.id)    
    else
      # 既に存在する場合は、紐づく情報を@chat_roomに代入する
      @chat_room        = user_room_relations.chat_room
    end
    
    # ＠chat_roomに紐づくチャット履歴を格納する@chatsを作成
    @chats              = @chat_room.chats
    # 新規投稿用の空インスタンス@chatを作成
    # この時に、chat_room_idを渡す
    # (form_withで、どのchat_roomに紐づくものか判別するため)
    @chat               = Chat.new(chat_room_id: @chat_room.id)
  end

  def create
    @chat               = current_user.chats.new(chat_params)
    respond_to do |format| # リクエストされるフォーマット形式で処理を分ける
      if @chat.save
        format.html { redirect_to @chat } # HTMLで返す場合、showアクションを実行する
        format.js # create.js.erbが呼び出される
      else
        format.html { render :show } # HTMLで返す場合、show.html.slimを表示
        format.js   { render :errors } 
      end
    end
  end

  private

    def chat_params
      params.require(:chat).permit(:message, :chat_room_id)
    end
end

