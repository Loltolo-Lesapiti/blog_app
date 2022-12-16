require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { Comment.create(author_id: 1, post_id: 1, text: 'comment') }
  it 'should have a user id' do
    comment.author_id = nil
    expect(comment).to_not be_valid
  end

  it 'should have a post id' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end

  it 'should have a user id' do
    comment.author_id = 1
    expect(comment).to be_valid
  end

  it 'should have a post id' do
    comment.post_id = 1
    expect(comment).to be_valid
  end

  it 'should have a same text' do
    expect(comment.text).to eq('comment')
  end
  context 'test comments' do
    before :each do
      @user = User.create(name: 'Loltolo', photo: ' ', bio: 'Full stack developer')
      @post = Post.create(author: @user, title: 'Second Post', text: 'This is my second post')
      @comment = Comment.create(post: @post, author: @user, text: 'Nice one here!')
    end
  
    it 'should increment the comments counter' do
      expect(@post.comments_counter).to eq 1
    end
  end
end

