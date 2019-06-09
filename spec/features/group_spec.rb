require 'rails_helper'

feature 'group', type: :feature do
  let(:user) { create(:user) }

  scenario 'post tweet' do
    # ~省略~

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content(user.name)

    # グループの作成
    expect {
      find('a.fa-edit').click
      expect(current_path).to eq new_group_path
      fill_in 'chat_group_name', with: 'Iチーム'
      find('input[type="submit"]').click
    }.to change(Group, :count).by(1)
  end
end