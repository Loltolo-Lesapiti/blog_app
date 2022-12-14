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
end
