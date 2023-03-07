require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    before(:example) do
      User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      visit users_path
    end

    after(:example) { User.destroy_all }

    it 'shows the username' do
      expect(page).to have_content('Tom')
    end

    it 'shows the profile picture' do
      expect(page).to have_css('img')
    end

    it 'shows the number of posts' do
      expect(page).to have_content('0')
    end

    it 'redirects to the users show page when view is clicked' do
      click_link 'View'
      expect(page).to have_content('Bio')
    end
  end

  describe 'show page' do
    before(:example) do
      u = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      3.times do
        Post.create(user: u, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      end
      visit user_path id: u.id
    end

    after(:example) do
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

    it 'shows the user bio' do
      expect(page).to have_content('Teacher')
    end

    it 'shows the users first three posts' do
      expect(page).to have_css('span', count: 3)
    end

    it 'contains a button' do
      expect(page).to have_selector('button')
    end

    it 'redirects to the users post index page when see all posts is clicked' do
      click_link 'See all posts'
      expect(page).to have_content('New Post')
    end
  end
end
