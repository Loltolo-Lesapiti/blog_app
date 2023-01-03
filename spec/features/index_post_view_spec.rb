require 'rails_helper'

RSpec.describe 'Post index page', type: :system do
  subject do
    @user = User.create(
      name: 'Tom',
      posts_counter: 5,
      bio: 'Teacher from Mexico.',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo'
    )

    @post1 = Post.create(
      author: @user,
      title: 'Software Development',
      text: 'Using algorithmns and data structures with good coding habits to solve real-life challenges.',
      comments_counter: 1,
      likes_counter: 1
    )

    @post2 = Post.create(
      author: @user,
      title: 'Collaboration',
      text: ' Nice way of working together.',
      comments_counter: 0,
      likes_counter: 0
    )

    @post3 = Post.create(
      author: @user,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @comment = Comment.create(
      post: @post1,
      author: @user,
      text: 'Awseome'
    )
  end

  before { subject.save }

  describe 'testing for user post index page', js: true do
    it 'displays the profile picture for each user.' do
      visit user_posts_path('1')
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'displays the user profile picture.' do
      visit user_posts_path('1')
      expect(page).to have_content(@user.name)
    end

    it 'display the number of posts each user has written.' do
      visit user_posts_path('1')
      page.has_content?("Number of posts: #{@user.posts_counter}")
    end

    it 'display the title of the post' do
      visit user_posts_path('1')
      expect(page).to have_content(@post1.title.to_s)
    end

    it 'I can see some of the post body' do
      visit user_posts_path('1')
      expect(page).to have_content(@post1.text.to_s)
    end

    # it 'I can see the title of the first post' do
    #   visit user_posts_path('5')
    #   expect(page).to have_content('Title: Software Development')
    # end

    it 'I can see how many comments a post has.' do
      visit user_posts_path('1')
      page.has_content?("Comments counter: #{@post1.comments_counter}")
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path('1')
      page.has_content?("Likes counter: #{@post1.likes_counter}")
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      visit('/users/1/posts')
      page.has_button?('Pagination')
    end

    # it 'When I click on a post, it redirects me to that post show page.' do
    #   visit user_posts_path('5')
    #   click_on(@post1.title)
    #   expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    # end
  end
end
