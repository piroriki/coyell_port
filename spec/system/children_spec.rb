require "rails_helper"

describe "子供管理機能", type: :system do
  describe "一覧表示機能" do
    before do
      user_a = FactoryBot.create(:user, name: "ユーザーA", email: "a@example.com")
      FactoryBot.create(:child, name: "最初の子供", gender: 0, age: 0, birthday: "2024-01-01", user: user_a)

      visit login_path
      fill_in "メールアドレス", with: "a@example.com"
      fill_in "パスワード",     with: "password"
      click_button "ログインする"
    end

    context "ユーザーAがログインしている時" do
      it "ユーザーAが登録した子供が表示される" do
        expect(page).to have_content "最初の子供"
      end
    end

    context "ユーザーBがログインしている時" do
      before do
        FactoryBot.create(:user, name: "ユーザーB", email: "b@example.com")
      end

      it "ユーザーAが登録した子供が表示されない" do
        expect(page).to have_no_content "最初の子供"
      end
    end
  end
end