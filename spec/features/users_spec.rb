require 'rails_helper'

RSpec.feature "Users", type: :feature do
   
   let(:user) { FactoryBot.create(:user) }
   
   scenario "create a new user" do
    sign_in_as user
    expect(page).to have_content "マイページ"
    expect(page).to have_content "ログインしました"
   end
  
   scenario "user successfully login" do
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
   
   scenario "user successfully logout" do
     sign_in_as user
     click_link "ログアウト"
     visit boards_path
     expect(page).to have_content "ログインしてください"
   end 
   
   scenario "successfully edit user" do
     sign_in_as user
     visit root_path
     click_link "編集"
    
   end
   
   scenario "user uploads an attachment" do
     sign_in_as user
     visit root_path
     click_link "編集"
     fill_in "user[name]", with: "edit_user"
     fill_in "user[email]", with: "edit@example.com"
     fill_in "user[password]", with: "test123"
     fill_in "user[password_confirmation]", with: "test123"
     attach_file "user[image]", "#{Rails.root}/spec/file/attachment.jpg"
     click_button "保存"
     expect(page).to have_content "更新が完了しました"
     expect(page).to have_content "edit_user"
     expect(page).to have_selector 'img'
   end

end