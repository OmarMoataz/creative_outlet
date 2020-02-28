# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get Posts', type: :request do
  let(:user) { create(:user) }
  let(:headers) { { 'Authorization' => "Bearer #{log_in_as(user)}" } }

  context 'List posts with pagination' do
    it 'returns five items' do
      create(:user_with_posts, posts_count: 15)
      get '/posts?per_page=5&page=1', headers: headers
      expect(JSON.parse(response&.body).length).to eq(5)
    end
  end
end
