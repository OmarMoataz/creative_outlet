require 'rails_helper'

RSpec.describe 'User Requests', type: :request do
  context 'Create Profile' do

    context 'valid create request' do
      let (:valid_attributes) { attributes_for(:user) }
      before { post '/users', params: { user: valid_attributes } }

      it 'returns status to reflect redirection' do
        expect(response).to have_http_status(302)
      end

      it 'creates a user' do
        expect{post '/users', params: { user: valid_attributes }}.to change {User.count}.by(1)
      end

      it 'redirects to root' do
        expect(response).to redirect_to root_path
      end
    end

    context 'invalid create request' do
      let (:invalid_attributes) { attributes_for(:user) }

      it "renders form" do
        expect{ post '/users', params: { user: invalid_attributes.merge(password_confirmation: "123")} }.not_to change {User.count}
        expect(response).to render_template(:new)
      end

      it "doesn't create user when invalid email" do
        expect{ post '/users', params: { user: invalid_attributes.merge(email: "123")} }.not_to change {User.count}
      end
    end
  end
end