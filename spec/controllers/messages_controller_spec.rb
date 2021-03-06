require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  describe '#index' do
    context 'login' do
      before do
        login_user
        get :index, params: { group_id: group.id }
      end

      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group 
      end

      it 'redners index' do
        expect(response).to render_template :index
      end
    end

    context 'not login' do
      before do
        get :index, params: { group_id: group.id }
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
    let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }

    context 'login' do
      before do
        login_user
      end
      context 'insert message accepted' do
        subject {
          post :create,
          params: params
        }
        it 'insert message' do
          expect{ subject }.to change(Message, :count).by(1)
        end
        it 'renders index' do
          subject
          expect(response).to redirect_to(group_messages_path(group))
        end
      end
      context 'insert message denied' do
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, text: nil, image: nil) } }
        subject {
          post :create,
          params: invalid_params
        }  
        it 'insert message' do
          expect{ subject }.not_to change(Message, :count)
        end
        it 'renders index' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'not login' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end 
  end
end