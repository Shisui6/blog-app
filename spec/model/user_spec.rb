require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter must be an integer' do
    subject.postsCounter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'postsCounter must be greater than or equal to 0' do
    subject.postsCounter = -5
    expect(subject).to_not be_valid
  end

  it '#last_three_posts should return 0 posts' do
    posts = subject.last_three_posts
    expect(posts.length).to eql(0)
  end
end
