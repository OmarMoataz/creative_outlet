require 'rails_helper'

RSpec.describe 'Post Requests', type: :request do
  context 'Create post' do

    context 'valid create request' do
      let(:user) { create(:user) }
      let(:valid_attributes) { attributes_for(:post) }

      before { log_in_as(user) }

      it "Creates a post" do
        expect{ post '/posts', params: { post: valid_attributes } }.to change { Post.count }.by(1)
      end
    end

    context 'invalid create request' do
      let(:valid_attributes) { attributes_for(:post) }

      it "Doesn't create post due to user not being logged in" do
        expect{ post '/posts', params: { post: valid_attributes } }.not_to change { Post.count }
      end

      it "redirect to login" do
        expect( post '/posts', params: valid_attributes ).to redirect_to login_path
      end
    end
  end
end