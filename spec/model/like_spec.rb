require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.new(user:, title: 'Hello', text: 'This is my first post')

  subject { Like.new(post:, user:) }

  it 'should be an instance of the Like class' do
    expect(subject).to be_instance_of(Like)
  end
end
