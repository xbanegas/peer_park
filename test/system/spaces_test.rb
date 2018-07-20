require "application_system_test_case"

class SpacesTest < ApplicationSystemTestCase
  setup do
    @space = spaces(:one)
  end

  test "visiting the index" do
    visit spaces_url
    assert_selector "h1", text: "Spaces"
  end

  test "creating a Space" do
    visit spaces_url
    click_on "New Space"

    fill_in "Address", with: @space.address
    fill_in "Avail F", with: @space.avail_f
    fill_in "Avail M", with: @space.avail_m
    fill_in "Avail Sa", with: @space.avail_sa
    fill_in "Avail Su", with: @space.avail_su
    fill_in "Avail T", with: @space.avail_t
    fill_in "Avail Th", with: @space.avail_th
    fill_in "Avail W", with: @space.avail_w
    fill_in "City", with: @space.city
    fill_in "Description", with: @space.description
    fill_in "Hourly Rate", with: @space.hourly_rate
    fill_in "Size", with: @space.size
    fill_in "State", with: @space.state
    fill_in "User", with: @space.user_id
    fill_in "Zip", with: @space.zip
    click_on "Create Space"

    assert_text "Space was successfully created"
    click_on "Back"
  end

  test "updating a Space" do
    visit spaces_url
    click_on "Edit", match: :first

    fill_in "Address", with: @space.address
    fill_in "Avail F", with: @space.avail_f
    fill_in "Avail M", with: @space.avail_m
    fill_in "Avail Sa", with: @space.avail_sa
    fill_in "Avail Su", with: @space.avail_su
    fill_in "Avail T", with: @space.avail_t
    fill_in "Avail Th", with: @space.avail_th
    fill_in "Avail W", with: @space.avail_w
    fill_in "City", with: @space.city
    fill_in "Description", with: @space.description
    fill_in "Hourly Rate", with: @space.hourly_rate
    fill_in "Size", with: @space.size
    fill_in "State", with: @space.state
    fill_in "User", with: @space.user_id
    fill_in "Zip", with: @space.zip
    click_on "Update Space"

    assert_text "Space was successfully updated"
    click_on "Back"
  end

  test "destroying a Space" do
    visit spaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Space was successfully destroyed"
  end
end
