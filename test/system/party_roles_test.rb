require "application_system_test_case"

class PartyRolesTest < ApplicationSystemTestCase
  setup do
    @party_role = party_roles(:one)
  end

  test "visiting the index" do
    visit party_roles_url
    assert_selector "h1", text: "Party Roles"
  end

  test "creating a Party role" do
    visit party_roles_url
    click_on "New Party Role"

    fill_in "Party", with: @party_role.party_id
    fill_in "Role type", with: @party_role.role_type_id
    click_on "Create Party role"

    assert_text "Party role was successfully created"
    click_on "Back"
  end

  test "updating a Party role" do
    visit party_roles_url
    click_on "Edit", match: :first

    fill_in "Party", with: @party_role.party_id
    fill_in "Role type", with: @party_role.role_type_id
    click_on "Update Party role"

    assert_text "Party role was successfully updated"
    click_on "Back"
  end

  test "destroying a Party role" do
    visit party_roles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Party role was successfully destroyed"
  end
end
