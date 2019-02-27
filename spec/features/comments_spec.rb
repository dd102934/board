require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  
  scenario "user creates a new comment" do
    user = FactoryBot.create(:user)
    board = FactoryBot.create(:board)
  
    
    sign_in_as user
    visit boards_path
    

    expect {
    click_link "詳細"
    fill_in "comment[comment]", with: "Test Comment"
    click_button "送信"
    
    aggregate_failures do
      expect(page).to have_content "Aaron"
      expect(page).to have_content "Test Comment"
    end
    }.to change(board.comments, :count).by(1)
  end
end
