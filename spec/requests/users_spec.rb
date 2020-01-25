# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Requests', type: :request do
  context 'Create Profile' do
    context 'valid create request' do
      let(:valid_attributes) { attributes_for(:user) }
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect { post '/users', params: valid_attributes }.to change { User.count }.by(1)
      end
    end

    context 'invalid create request' do
      let(:invalid_attributes) { attributes_for(:user) }

      it "Doesn't create user when invalid email" do
        post '/users', params: invalid_attributes.merge(email: '123')
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['email'][0]).to match(/is invalid/)
      end
    end
  end
end
