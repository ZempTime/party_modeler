require 'test_helper'

class PartyRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party_relationship = party_relationships(:one)
  end

  test "should get index" do
    get party_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_party_relationship_url
    assert_response :success
  end

  test "should create party_relationship" do
    assert_difference('PartyRelationship.count') do
      post party_relationships_url, params: { party_relationship: { from_role_id: @party_relationship.from_role_id, thru_date: @party_relationship.thru_date, to_role_id: @party_relationship.to_role_id } }
    end

    assert_redirected_to party_relationship_url(PartyRelationship.last)
  end

  test "should show party_relationship" do
    get party_relationship_url(@party_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_party_relationship_url(@party_relationship)
    assert_response :success
  end

  test "should update party_relationship" do
    patch party_relationship_url(@party_relationship), params: { party_relationship: { from_role_id: @party_relationship.from_role_id, thru_date: @party_relationship.thru_date, to_role_id: @party_relationship.to_role_id } }
    assert_redirected_to party_relationship_url(@party_relationship)
  end

  test "should destroy party_relationship" do
    assert_difference('PartyRelationship.count', -1) do
      delete party_relationship_url(@party_relationship)
    end

    assert_redirected_to party_relationships_url
  end
end
