require 'rails_helper'

RSpec.feature "Boards", type: :feature do
  
  scenario "user creates a new board" do
    user = FactoryBot.create(:user)
    
    sign_in_as user
    visit boards_path

    expect {
      click_link "新規作成"
      fill_in "board[title]", with: "Test Board"
      fill_in "board[body]", with: "Trying test"
      click_button "保存"

      aggregate_failures do
        expect(page).to have_content "Aaron"
        expect(page).to have_content "Test Board"
        expect(page).to have_content "Trying test"
      end
    }.to change(user.boards, :count).by(1)
    
  end
  
  scenario "user delete a board" do
    user = FactoryBot.create(:user,admin: true)
    sign_in_as user
    
    visit boards_path
    
    click_link "新規作成"
    fill_in "board[title]", with: "Test Board"
    fill_in "board[body]", with: "Trying test"
    click_button "保存"
    visit boards_path
    
    expect {
      click_link "削除"
      expect(page).to have_content "「Test Board」の掲示板が削除されました"
    }.to change(user.boards, :count).by(-1)

  end
end
