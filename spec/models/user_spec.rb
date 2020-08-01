require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should have_many(:posts) }

  let(:user) { create(:user_with_posts) }
  let(:other_user) { create(:user_with_posts) }
  let(:third_user) { create(:user_with_posts) }

  context 'when user follows another user' do
    it 'increses following count by 1' do
      expect{ user.follow(other_user) }.to change{ user.following.count}.by(1)
      expect(user.following.include?(other_user))
    end

    it 'increases followers count by 1' do
      expect{ user.follow(other_user) }.to change{ other_user.followers.count }.by(1)
      expect(other_user.followers.include?(user))
    end
  end

  context 'when user unfollows another user' do
    it 'decreases following count by 1' do
      user.follow(other_user)
      expect{ user.unfollow(other_user) }.to change{ user.following.count }.by(-1)
      expect(user.following.exclude?(other_user))
    end

    it "descreases follower count by 1" do
      user.follow(other_user)
      expect{ user.unfollow(other_user) }.to change{ other_user.followers.count }.by(-1)
      expect(other_user.followers.exclude?(user))
    end
  end

  context "User feed" do
    it "followed user post should end up in the feed" do
      user.follow(other_user)
      user.feed.include?(other_user.posts.first)
    end

    it "unfollowed user's posts shouldn't end up in feed" do
      user.feed.exclude?(third_user.posts.first)
    end
  end
end
