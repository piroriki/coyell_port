require "rails_helper"

describe "子供管理機能", type: :system do
  # letを使用して、事前にユーザーデータを作成しておく
  let(:user_a) { FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com", password: "password") }
  let(:user_b) { FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com", password: "password") }
  let(:child_a) { FactoryBot.create(:child, name: "最初の子供", gender: 0, age: 0, birthday: "2024-01-01", user: user_a) }

  # beforeを使用してログイン部分共通化
  before do
    visit login_path
    fill_in "メールアドレス", with: login_user.email
    fill_in "パスワード",    with: login_user.password
    click_button "ログインする"
  end

  describe "一覧表示機能" do
    context "ユーザーAがログインしている時" do
      let!(:login_user) { user_a }
      let!(:child_data) { child_a }
      
      it "ユーザーAが登録した子供が表示される" do
        expect(page).to have_content "最初の子供"
      end
    end

    context "ユーザーBがログインしている時" do
      let!(:login_user) { user_b }

      it "ユーザーAが登録した子供が表示されない" do
        expect(page).to have_no_content "最初の子供"
      end
    end
  end

  describe "詳細表示機能" do
    context "ユーザーAがログインしている時" do
      let!(:login_user) { user_a }
      let!(:child_data) { child_a }

      # 最初の共通化ブロックを処理できなかったため追加
      before do
        visit child_path(child_a)
      end
  
      it "ユーザーAが登録した子供が表示される" do
        expect(page).to have_content "最初の子供"
      end
    end
  end
end