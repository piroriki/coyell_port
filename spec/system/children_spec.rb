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

  # shared_exampleで、it部分の内容共通化
  #shared_examples_for "ユーザーAが登録した子供が表示される" do
  #  it { expect(page).to have_content "最初の子供" }
  #end

  describe "一覧表示機能" do
    context "ユーザーAがログインしている時" do
      let!(:login_user) { user_a }
      let!(:child_data) { child_a }

      #it_behaves_like "ユーザーAが登録した子供が表示される"
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
        expect(page).to have_content "%{child_name}さんの詳細"
        expect(page).to have_content "その他"
      end
    end
  end

  describe "新規作成機能" do
    let!(:login_user) { user_a }
    let!(:child_data) { child_a }

    before do
      visit new_child_path
      
      fill_in "お名前",           with: child_data.name
      select "その他",            from: "child[gender]" # selectカラムはselectで入力
      fill_in "年齢",             with: child_data.age
      # date_selectカラムは各項目に分けて入力
      select "2000",             from: "child[birthday(1i)]" 
      select "1",                from: "child[birthday(2i)]"
      select "1",                from: "child[birthday(3i)]"
      
      click_button "登録する"
    end

    context "新規作成画面で子供の名前を入力した時" do
      it "正常に表示される" do
        expect(page).to have_content "お子様一覧"
        expect(page).to have_content "最初の子供"
      end
    end
  end
end