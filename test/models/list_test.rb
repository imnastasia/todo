require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test 'validates presence of name' do
    user = users(:one)
    list = List.new(user: user)
    assert_not list.valid?
    assert_includes list.errors[:name], "can't be blank"
  end

  test 'is valid with a name and user' do
    user = users(:one)
    list = List.new(name: 'My List', user:)
    assert list.valid?
  end

  test 'can be saved with valid attributes' do
    user = users(:one)
    list = List.new(name: 'Shopping List', user:)
    assert list.save
  end

  test 'cannot be saved without a name' do
    user = users(:one)

    list = List.new(user:)
    assert_not list.save
  end

  test 'accepts empty string as invalid' do
    user = users(:one)
    list = List.new(name: '', user:)
    assert_not list.valid?
    assert_includes list.errors[:name], "can't be blank"
  end

  test 'validates uniqueness of name scoped to user' do
    user = users(:one)
    List.create!(name: 'Duplicate List', user:)
    duplicate_list = List.new(name: 'Duplicate List', user:)
    assert_not duplicate_list.valid?
    assert_includes duplicate_list.errors[:name], 'has already been taken'
  end

  test 'allows same name for different users' do
    user1 = users(:one)
    user2 = users(:two)
    List.create!(name: 'Same Name', user: user1)
    list2 = List.new(name: 'Same Name', user: user2)
    assert list2.valid?
  end

  test 'requires user association' do
    list = List.new(name: 'Test List')
    assert_not list.valid?
    assert_includes list.errors[:user], 'must exist'
  end

  test 'accepts whitespace-only string as invalid' do
    user = users(:one)
    list = List.new(name: '   ', user:)
    assert_not list.valid?
    assert_includes list.errors[:name], "can't be blank"
  end
end
