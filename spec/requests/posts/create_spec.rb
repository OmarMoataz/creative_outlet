# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post Requests', type: :request do
  context 'Create post' do
    let(:user) { create(:user) }
    let(:user_reader) { create(:user_with_role_reader) }
    let(:headers_writer) { { 'Authorization' => "Bearer #{log_in_as(user)}" } }
    let(:reader_headers) { { 'Authorization' => "Bearer #{log_in_as(user_reader)}" } }
    let(:valid_attributes) { attributes_for(:post) }

    context 'valid create request' do
      it 'Creates a post' do
        post '/posts', params: valid_attributes, headers: headers_writer
        expect(response).to have_http_status(200)
      end
    end

    context 'Invalid create request' do
      let(:valid_attributes) { attributes_for(:post) }

      context "authorization error (401)" do
        it "Doesn't create post due to invalid token" do
          post '/posts', params: { post: valid_attributes }
          expect(response).to have_http_status(401)
          expect(response.body).to match(/Invalid token/)
        end

        it "Doesn't create post because user doesn't have writer role" do
          post '/posts', params: { post: valid_attributes, headers: reader_headers }
        end
      end

      it "Doesn't create post due to content being blank (422)" do
        post '/posts', params: { post: valid_attributes.merge(content: nil) }, headers: headers_writer
        expect(response).to have_http_status(422)
      end

      it "Doesn't create post due to content being blank (422)" do
        post '/posts', params: { post: valid_attributes.merge(title: nil) }, headers: headers_writer
        expect(response).to have_http_status(422)
      end

      it "Doesn't create post due to description being blank (422)" do
        post '/posts', params: { post: valid_attributes.merge(description: nil) }, headers: headers_writer
        expect(response).to have_http_status(422)
      end
    end
  end
end
