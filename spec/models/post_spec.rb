require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { Post.create(title: 'First post', comments_counter: 1, likes_counter: 15) }
  it 'should have a title' do
    expect(post.title).to eq('First post')
  end

  it 'should have a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'should have a valid length of title' do
    post.title = 'a' * 255
    expect(post).to_not be_valid
  end

  it 'comments count should be an integer' do
    post.comments_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'should have comments' do
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'comments count should not be less than than 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'should have likes' do
    post.likes_counter = nil
    expect(post).to_not be_valid
  end

  it 'likes count should be integer' do
    post.likes_counter = 'a'
    expect(post).to_not be_valid
  end

  it 'likes counter should not be less than 0' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
  context 'test posts' do
    before :each do
      @user = User.create(name: 'Loltolo', photo: '', bio: 'Software Developer')
      @post = Post.create(author: @user, title: 'Third post', text: 'Im making the third one here')
    end
    it 'should return the 5 most recent posts' do
      Comment.create(post: @post, author: @user, text: 'One')
      Comment.create(post: @post, author: @user, text: 'Two')
      Comment.create(post: @post, author: @user, text: 'Three')
      Comment.create(post: @post, author: @user, text: 'Four')
      Comment.create(post: @post, author: @user, text: 'Five')
      Comment.create(post: @post, author: @user, text: 'Six')
      expect(@post.recent_comments.length) == 5
    end
  end
end
