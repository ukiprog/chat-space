require 'rails_helper'

describe UsersController do
  describe 'GET #edit' do
    it "renders the :edit template" do
      login_user
      # get :edit
      # expect(response).to render_template :edit
    end
  end
end