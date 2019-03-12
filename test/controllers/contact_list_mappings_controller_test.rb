require 'test_helper'

class ContactListMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_list_mapping = contact_list_mappings(:one)
  end

  test "should get index" do
    get contact_list_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_list_mapping_url
    assert_response :success
  end

  test "should create contact_list_mapping" do
    assert_difference('ContactListMapping.count') do
      post contact_list_mappings_url, params: { contact_list_mapping: { contact_lists_id: @contact_list_mapping.contact_lists_id, contacts_id: @contact_list_mapping.contacts_id } }
    end

    assert_redirected_to contact_list_mapping_url(ContactListMapping.last)
  end

  test "should show contact_list_mapping" do
    get contact_list_mapping_url(@contact_list_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_list_mapping_url(@contact_list_mapping)
    assert_response :success
  end

  test "should update contact_list_mapping" do
    patch contact_list_mapping_url(@contact_list_mapping), params: { contact_list_mapping: { contact_lists_id: @contact_list_mapping.contact_lists_id, contacts_id: @contact_list_mapping.contacts_id } }
    assert_redirected_to contact_list_mapping_url(@contact_list_mapping)
  end

  test "should destroy contact_list_mapping" do
    assert_difference('ContactListMapping.count', -1) do
      delete contact_list_mapping_url(@contact_list_mapping)
    end

    assert_redirected_to contact_list_mappings_url
  end
end
