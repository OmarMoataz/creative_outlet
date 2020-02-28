# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post Requests', type: :request do
  context 'Create post' do
    let(:user) { create(:user) }
    let(:headers) { { 'Authorization' => "Bearer #{log_in_as(user)}" } }
    let(:valid_attributes) { attributes_for(:post) }

    context 'valid create request' do
      it 'Creates a post' do
          post '/posts', params: valid_attributes, headers: headers
          expect(response).to have_http_status(200)
      end
    end

    context 'Invalid create request' do
      let(:valid_attributes) { attributes_for(:post) }

      it "Doesn't create post due to authorization error (401)" do
        post '/posts', params: { post: valid_attributes }
        expect(response).to have_http_status(401)
        expect(response.body).to match(/Nil JSON web token/)
      end

      it "Doesn't create post due to content being blank (422)" do
        post '/posts', params: { post: valid_attributes.merge(content: nil) }, headers: headers
        expect(response).to have_http_status(422)
      end

      it "Doesn't create post due to content being blank (422)" do
        post '/posts', params: { post: valid_attributes.merge(title: nil) }, headers: headers
        expect(response).to have_http_status(422)
      end

      it "Doesn't create post due to description being blank (422)" do
        post '/posts', params: { post: valid_attributes.merge(description: nil) }, headers: headers
        expect(response).to have_http_status(422)
      end
    end
  end
end
