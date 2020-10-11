require "application_system_test_case"

class PartyRelationshipTypesTest < ApplicationSystemTestCase
  setup do
    @party_relationship_type = party_relationship_types(:one)
  end

  test "visiting the index" do
    visit party_relationship_types_url
    assert_selector "h1", text: "Party Relationship Types"
  end

  test "creating a Party relationship type" do
    visit party_relationship_types_url
    click_on "New Party Relationship Type"

    fill_in "Description", with: @party_relationship_type.description
    fill_in "From role", with: @party_relationship_type.from_role_id
    fill_in "Name", with: @party_relationship_type.name
    fill_in "To role", with: @party_relationship_type.to_role_id
    click_on "Create Party relationship type"

    assert_text "Party relationship type was successfully created"
    click_on "Back"
  end

  test "updating a Party relationship type" do
    visit party_relationship_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @party_relationship_type.description
    fill_in "From role", with: @party_relationship_type.from_role_id
    fill_in "Name", with: @party_relationship_type.name
    fill_in "To role", with: @party_relationship_type.to_role_id
    click_on "Update Party relationship type"

    assert_text "Party relationship type was successfully updated"
    click_on "Back"
  end

  test "destroying a Party relationship type" do
    visit party_relationship_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Party relationship type was successfully destroyed"
  end
end
