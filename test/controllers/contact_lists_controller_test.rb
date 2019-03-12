require 'test_helper'

class ContactListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_list = contact_lists(:one)
  end

  test "should get index" do
    get contact_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_list_url
    assert_response :success
  end

  test "should create contact_list" do
    assert_difference('ContactList.count') do
      post contact_lists_url, params: { contact_list: { name: @contact_list.name } }
    end

    assert_redirected_to contact_list_url(ContactList.last)
  end

  test "should show contact_list" do
    get contact_list_url(@contact_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_list_url(@contact_list)
    assert_response :success
  end

  test "should update contact_list" do
    patch contact_list_url(@contact_list), params: { contact_list: { name: @contact_list.name } }
    assert_redirected_to contact_list_url(@contact_list)
  end

  test "should destroy contact_list" do
    assert_difference('ContactList.count', -1) do
      delete contact_list_url(@contact_list)
    end

    assert_redirected_to contact_lists_url
  end
end
