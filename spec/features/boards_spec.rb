require 'rails_helper'

RSpec.feature "Boards", type: :feature do
  let(:user) { FactoryBot.create(:user,admin: true) }
  
  scenario "user creates a new board" do

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
  
  #scenario "user creates a new board adding tags" do
    #sign_in_as user
    
    #visit boards_path
    
    #click_link "新規作成"
    #fill_in "board[title]", with: "Test Board"
    #fill_in "board[body]", with: "Trying test"
    #find('#board_tag_ids_1', visible: false).trigger("click")
    #expect(page).to have_checked_field("プログラミング")
    
    #click_button "保存"
    
    #aggregate_failures do
      #expect(page).to have_content "プログラミング"
    #end
  #end
end
