require 'rails_helper'

RSpec.feature "Users", type: :feature do
   
   let(:user) { FactoryBot.create(:user) }
   
   scenario "sign in a user" do
    sign_in_as user
    expect(page).to have_content "マイページ"
    expect(page).to have_content "ログインしました"
   end
  
   scenario "user successfully signs up" do
     visit root_path
     click_link "登録"
      
     expect {
        fill_in "user[name]", with: "Test_user"
        fill_in "user[email]", with: "test@example.com"
        fill_in "user[password]", with: "test123"
        fill_in "user[password_confirmation]", with: "test123"
        click_button "作成"
      }.to change(User, :count).by(1)

  
     expect(page).to have_content "ようこそ BoardAppへ！"
     expect(page).to have_content "Test_user"
   end
end