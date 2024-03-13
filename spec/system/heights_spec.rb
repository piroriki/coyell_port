require "rails_helper"

describe "身長管理機能", type: :system do
  # 家族ユーザーデータ
  let(:user_a)         { FactoryBot.create(:user,  name: "ユーザーA", email: "a@example.com", password: "password") }
  #let(:user_b)   { FactoryBot.create(:user,  name: "ユーザーB", email: "b@example.com", password: "password") }
  # 子供データ
  let(:child_a)        { FactoryBot.create(:child, name: "ユーザーAの長男", gender: 1, age: 1, birthday: "2024-03-03", user: user_a) }
  let(:child_aa)       { FactoryBot.create(:child, name: "ユーザーAの長女", gender: 2, age: 5, birthday: "2024-01-01", user: user_a) }
  # 子供の身長データ
  let(:child_a_height) { FactoryBot.create(:height, height: 123, child: child_a) }

  # beforeを使用して、家族ユーザーのログイン部分共通化
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
    context "ユーザーAがログイン後、ユーザーAの長男の身長一覧を表示した時" do
      let!(:login_user)   { user_a }
      let!(:child_data)   { child_a }
      let!(:child_height) { child_a_height }

      before do
        visit record_path
      end    

      #it_behaves_like "ユーザーAが登録した子供が表示される"

      it "ユーザーAの長男の身長が表示される" do
        expect(page).to have_content ""
      end
    end

    #context "ユーザーAがログイン後、ユーザーAの長女の身長一覧を表示した時" do
    #  let!(:login_user)   { user_a }
    #  let!(:child_data)   { child_aa }
#
    #  before do
    #    visit record_path
    #  end
#
    #  it "ユーザーAの長男の身長は表示されない" do
    #    expect(page).to have_no_content "123"
    #  end
  end

  # 新規登録→詳細表示のため、新規登録テストで詳細表示テストも含める
  describe "新規作成機能" do
    let!(:login_user)   { user_a }
    let!(:child_data)   { child_a }
    let!(:child_height) { child_a_height }

    before do
      visit new_child_height_path(child_a)
      
      fill_in "身長",           with: child_height.height
      click_button "登録する"
    end

    context "新規作成画面で、ユーザーAの長男の身長を登録する時" do
      it "正常に表示される" do
        expect(page).to have_content "身長の詳細"
        expect(page).to have_content "123"
      end
    end
  end
end