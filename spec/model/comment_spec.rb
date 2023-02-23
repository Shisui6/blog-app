require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.new(user:, title: 'Hello', text: 'This is my first post')

  subject { Comment.new(post:, user:, text: 'Hi Tom!') }

  it 'should be an instance of the Comment class' do
    expect(subject).to be_instance_of(Comment)
  end
end
