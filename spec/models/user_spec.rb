require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(name: 'Loltolo', photo: 'https://avatars.githubusercontent.com/u/25284722?s=40&v=4', bio: 'Full stack developer', post_counter: 1) }
  it 'should have a name' do
    user.name = nil
    expect(user).to be_valid
  end

  it 'name should be Loltolo' do
    expect(user.name).to eq('Loltolo')
  end

  it 'should have posts' do
    user.post_counter = nil
    expect(user).to be_valid
  end

  it 'posts count should be integers' do
    user.post_counter = 'a'
    expect(user).to be_valid
  end

  it 'posts count should be greater than or equals 0' do
    user.post_counter = 1
    expect(user).to be_valid
  end

  it 'posts count should not be less than 0' do
    user.post_counter = -1
    expect(user).to be_valid
  end
end