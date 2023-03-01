require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.create(user: first_user, title: 'Hello', text: 'This is my first post') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must have a maximum length of 250 characters' do
    subject.title = 'hello' * 30
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be an integer' do
    subject.comments_counter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be greater than or equal to 0' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be an integer' do
    subject.likes_counter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be greater than or equal to 0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it '#last_five_comments should return 0 posts' do
    posts = subject.last_five_comments
    expect(posts.length).to eql(0)
  end
end
