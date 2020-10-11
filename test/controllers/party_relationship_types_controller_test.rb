require 'test_helper'

class PartyRelationshipTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party_relationship_type = party_relationship_types(:one)
  end

  test "should get index" do
    get party_relationship_types_url
    assert_response :success
  end

  test "should get new" do
    get new_party_relationship_type_url
    assert_response :success
  end

  test "should create party_relationship_type" do
    assert_difference('PartyRelationshipType.count') do
      post party_relationship_types_url, params: { party_relationship_type: { description: @party_relationship_type.description, from_role_id: @party_relationship_type.from_role_id, name: @party_relationship_type.name, to_role_id: @party_relationship_type.to_role_id } }
    end

    assert_redirected_to party_relationship_type_url(PartyRelationshipType.last)
  end

  test "should show party_relationship_type" do
    get party_relationship_type_url(@party_relationship_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_party_relationship_type_url(@party_relationship_type)
    assert_response :success
  end

  test "should update party_relationship_type" do
    patch party_relationship_type_url(@party_relationship_type), params: { party_relationship_type: { description: @party_relationship_type.description, from_role_id: @party_relationship_type.from_role_id, name: @party_relationship_type.name, to_role_id: @party_relationship_type.to_role_id } }
    assert_redirected_to party_relationship_type_url(@party_relationship_type)
  end

  test "should destroy party_relationship_type" do
    assert_difference('PartyRelationshipType.count', -1) do
      delete party_relationship_type_url(@party_relationship_type)
    end

    assert_redirected_to party_relationship_types_url
  end
end
