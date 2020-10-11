require "application_system_test_case"

class PartyRelationshipsTest < ApplicationSystemTestCase
  setup do
    @party_relationship = party_relationships(:one)
  end

  test "visiting the index" do
    visit party_relationships_url
    assert_selector "h1", text: "Party Relationships"
  end

  test "creating a Party relationship" do
    visit party_relationships_url
    click_on "New Party Relationship"

    fill_in "From role", with: @party_relationship.from_role_id
    fill_in "Thru date", with: @party_relationship.thru_date
    fill_in "To role", with: @party_relationship.to_role_id
    click_on "Create Party relationship"

    assert_text "Party relationship was successfully created"
    click_on "Back"
  end

  test "updating a Party relationship" do
    visit party_relationships_url
    click_on "Edit", match: :first

    fill_in "From role", with: @party_relationship.from_role_id
    fill_in "Thru date", with: @party_relationship.thru_date
    fill_in "To role", with: @party_relationship.to_role_id
    click_on "Update Party relationship"

    assert_text "Party relationship was successfully updated"
    click_on "Back"
  end

  test "destroying a Party relationship" do
    visit party_relationships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Party relationship was successfully destroyed"
  end
end
