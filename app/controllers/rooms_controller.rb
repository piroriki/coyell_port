class RoomsController < ApplicationController

  # ログインユーザーのroom一覧の相手の名前を表示する
  # ログインユーザーが所属するroomの、ログインユーザー以外のユーザー名を取得させる
  def index
    @user                   = current_user
    @currentEntries         = current_user.entries
    # @currentEntriesのルームを配列にする
    myRoomIds               = []
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    # @currentEntriesのルームであり、かつcurrent_userでないEntryを新着順で取得する
    @anotherEntries         = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id).order(created_at: :desc)
  end 
  
  # ルームの詳細表示
  def show
    @room                   = Room.find(params[:id])
    # ルームが作成されているかどうかを判定する
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      # 作成されている場合、新規作成される@chatsと@entriesを新たに用意する
      @direct_messages      = @room.chats
      @entries              = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end 

  # ルームを作成
  # ルームに紐づいたentryユーザー２人を作成する
  def create
    @room                   = Room.create(name: "DM")
    # entry1にはログインユーザーを作成
    @entry1                 = Entry.create(room_id: @room.id, user_id: current_user.id)
    # entry2にはparamsユーザーを作成
    @entry2                 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  # ルーム削除
  def destroy
    room                    = Room.find(params[:id])
    room.destroy
    redirect_back users_rooms_path

end
