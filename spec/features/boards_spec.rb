require 'rails_helper'

RSpec.feature "Boards", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  #boardを作ってタイトルテスト

  scenario "user signs in" do
    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_button "ログイン"
    expect(page).to have_content "マイページ"
    expect(page).to have_content "ログインしました"
  end
end
