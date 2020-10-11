require "application_system_test_case"

class RoleTypesTest < ApplicationSystemTestCase
  setup do
    @role_type = role_types(:one)
  end

  test "visiting the index" do
    visit role_types_url
    assert_selector "h1", text: "Role Types"
  end

  test "creating a Role type" do
    visit role_types_url
    click_on "New Role Type"

    fill_in "Description", with: @role_type.description
    click_on "Create Role type"

    assert_text "Role type was successfully created"
    click_on "Back"
  end

  test "updating a Role type" do
    visit role_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @role_type.description
    click_on "Update Role type"

    assert_text "Role type was successfully updated"
    click_on "Back"
  end

  test "destroying a Role type" do
    visit role_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Role type was successfully destroyed"
  end
end
