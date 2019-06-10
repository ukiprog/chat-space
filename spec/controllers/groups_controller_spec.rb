require 'rails_helper'

describe GroupsController do
  describe 'GET #edit' do
    it "assigns the requested group to @group" do
      group = create(:group)
      get :edit, params: { id: group }
      expect(assigns(:group)).to eq group
    end

    it "renders the :edit template" do
      group = create(:group)
      get :edit, params: { id: group }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of groups ordered by created_at DESC" do
      # current_userから引っ張ってこないといけない
      groups = create_list(:group, 3) 
      get :index
      expect(assigns(:groups)).to match(groups)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end