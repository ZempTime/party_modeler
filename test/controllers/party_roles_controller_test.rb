require 'test_helper'

class PartyRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party_role = party_roles(:one)
  end

  test "should get index" do
    get party_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_party_role_url
    assert_response :success
  end

  test "should create party_role" do
    assert_difference('PartyRole.count') do
      post party_roles_url, params: { party_role: { party_id: @party_role.party_id, role_type_id: @party_role.role_type_id } }
    end

    assert_redirected_to party_role_url(PartyRole.last)
  end

  test "should show party_role" do
    get party_role_url(@party_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_party_role_url(@party_role)
    assert_response :success
  end

  test "should update party_role" do
    patch party_role_url(@party_role), params: { party_role: { party_id: @party_role.party_id, role_type_id: @party_role.role_type_id } }
    assert_redirected_to party_role_url(@party_role)
  end

  test "should destroy party_role" do
    assert_difference('PartyRole.count', -1) do
      delete party_role_url(@party_role)
    end

    assert_redirected_to party_roles_url
  end
end
