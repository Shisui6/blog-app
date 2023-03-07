require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'index page' do
    before(:example) do
      u = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      post1 = Post.create(user: u, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      2.times do
        Post.create(user: u, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      end
      Comment.create(post: post1, user: u, text: 'Hi Tom!')

      visit user_posts_path user_id: u.id
    end

    after(:example) do
      Comment.destroy_all
      Post.destroy_all
      User.destroy_all
    end

    it 'shows the profile picture' do
      expect(page).to have_css('img')
    end

    it 'shows the username' do
      expect(page).to have_content('Tom')
    end

    it 'shows the number of posts' do
      expect(page).to have_content('3')
    end

    it 'shows the post title' do
      expect(page).to have_content('Post #')
    end

    it 'shows the post body' do
      expect(page).to have_content('This is my first post')
    end

    it 'shows the post comments' do
      expect(page).to have_content('Hi Tom!')
    end

    it 'shows the number of comments' do
      expect(page).to have_content('1')
    end

    it 'shows the number of likes' do
      expect(page).to have_content('0')
    end

    it 'redirects to the posts show page when view is clicked' do
      first('.view-post > a').click
      expect(page).to have_content('New Comment')
    end
  end

  describe 'show page' do
    before(:example) do
      u = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      post1 = Post.create(user: u, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      2.times do
        Post.create(user: u, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      end
      Comment.create(post: post1, user: u, text: 'Hi Tom!')

      visit user_post_path user_id: u.id, id: post1.id
    end

    after(:example) do
      Comment.destroy_all
      Post.destroy_all
      User.destroy_all
    end

    it 'shows the post title' do
      expect(page).to have_content('by Tom')
    end

    it 'shows the post author' do
      expect(page).to have_content('Tom')
    end

    it 'shows the number of comments' do
      expect(page).to have_content('1')
    end

    it 'shows the number of likes' do
      expect(page).to have_content('0')
    end

    it 'shows the post body' do
      expect(page).to have_content('This is my first post')
    end

    it 'shows the username of commentor' do
      expect(page).to have_content('Tom:')
    end

    it 'shows the comment' do
      expect(page).to have_content('Hi Tom!')
    end
  end
end
