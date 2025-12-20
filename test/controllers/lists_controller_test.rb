require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
    @list = lists(:one)
    @other_list = lists(:two)
    sign_in_as(@user)
  end

  test 'should get index' do
    get lists_url
    assert_response :success
    assert_select 'h1', 'My Lists'
    assert_select '#lists'
  end

  test 'should show all lists in index' do
    get lists_url
    assert_select '.bg-white.rounded-xl', count: 3 # All three lists should be visible
  end

  test 'should get new' do
    get new_list_url
    assert_response :success
    assert_select 'h1', 'Create New List'
    assert_select 'form'
  end

  test 'should create list with valid params' do
    assert_difference('List.count') do
      post lists_url, params: { list: { name: 'My New List' } }
    end

    list = List.last
    assert_equal 'My New List', list.name
    assert_equal @user, list.user
    assert_redirected_to list_url(list)
  end

  test 'should not create list without name' do
    assert_no_difference('List.count') do
      post lists_url, params: { list: { name: '' } }
    end

    assert_response :unprocessable_content
    assert_select '.bg-red-50' # Error message container
  end

  test 'should show list' do
    get list_url(@list)
    assert_response :success
    assert_select 'h1', @list.name
    assert_select "a[href='#{edit_list_path(@list)}']", 'Edit'
    assert_select "form[action='#{list_path(@list)}'][method='post']" # Delete form
  end

  test 'should redirect when list not found' do
    get list_url(id: 'nonexistent')
    assert_redirected_to lists_url
  end

  test 'should get edit' do
    get edit_list_url(@list)
    assert_response :success
    assert_select 'h1', 'Edit List'
    assert_select 'form'
    assert_select "input[value='#{@list.name}']"
  end

  test 'should redirect edit when list not found' do
    get edit_list_url(id: 'nonexistent')
    assert_redirected_to lists_url
  end

  test 'should update list with valid params' do
    patch list_url(@list), params: { list: { name: 'Updated List Name' } }

    @list.reload
    assert_equal 'Updated List Name', @list.name
    assert_redirected_to list_url(@list)
    follow_redirect!
    assert_select '.notice', /successfully updated/i
  end

  test 'should not update list with invalid params' do
    original_name = @list.name
    patch list_url(@list), params: { list: { name: '' } }

    @list.reload
    assert_equal original_name, @list.name
    assert_response :unprocessable_content
    assert_select '.bg-red-50' # Error message container
  end

  test 'should handle update when list not found' do
    patch list_url(id: 'nonexistent'), params: { list: { name: 'New Name' } }
    assert_redirected_to lists_url
    follow_redirect!
    assert_select '.alert', /not found/i
  end

  test 'should destroy list' do
    assert_difference('List.count', -1) do
      delete list_url(@list)
    end

    assert_redirected_to lists_url
    follow_redirect!
    assert_select '.notice', /successfully deleted/i
  end

  test 'should handle destroy when list not found' do
    delete list_url(id: 'nonexistent')
    assert_redirected_to lists_url
    follow_redirect!
    assert_select '.alert', /not found/i
  end

  test 'should show empty state when no lists' do
    List.destroy_all
    get lists_url
    assert_response :success
    assert_select '.col-span-full', text: /No lists yet/
    assert_select "a[href='#{new_list_path}']", 'Create your first list'
  end

  test 'index should show edit and delete buttons for each list' do
    get lists_url

    List.all.each do |list|
      assert_select "a[href='#{edit_list_path(list)}']"
      assert_select "form[action='#{list_path(list)}'][method='post']"
    end
  end

  test 'new form should have cancel link' do
    get new_list_url
    assert_select "a[href='#{lists_path}']", 'Cancel'
  end

  test 'edit form should have cancel link' do
    get edit_list_url(@list)
    assert_select "a[href='#{lists_path}']", 'Cancel'
  end

  test 'show page should have back link' do
    get list_url(@list)
    assert_select 'a', 'Back'
  end

  private

  def sign_in_as(user)
    # For integration tests, we need to make an actual login request
    post session_url, params: {
      email_address: user.email_address,
      password: 'password'
    }
    # If the login redirects, follow it
    follow_redirect! if response.redirect?
  end
end
