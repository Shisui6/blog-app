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

  it 'commentsCounter must be an integer' do
    subject.commentsCounter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'commentsCounter must be greater than or equal to 0' do
    subject.commentsCounter = -5
    expect(subject).to_not be_valid
  end

  it 'likesCounter must be an integer' do
    subject.likesCounter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'likesCounter must be greater than or equal to 0' do
    subject.likesCounter = -5
    expect(subject).to_not be_valid
  end

  it '#last_five_comments should return 0 posts' do
    posts = subject.last_five_comments
    expect(posts.length).to eql(0)
  end
end
