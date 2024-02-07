require "application_system_test_case"

class FaunasTest < ApplicationSystemTestCase
  setup do
    @fauna = faunas(:one)
  end

  test "visiting the index" do
    visit faunas_url
    assert_selector "h1", text: "Faunas"
  end

  test "should create fauna" do
    visit faunas_url
    click_on "New fauna"

    fill_in "Name", with: @fauna.name
    click_on "Create Fauna"

    assert_text "Fauna was successfully created"
    click_on "Back"
  end

  test "should update Fauna" do
    visit fauna_url(@fauna)
    click_on "Edit this fauna", match: :first

    fill_in "Name", with: @fauna.name
    click_on "Update Fauna"

    assert_text "Fauna was successfully updated"
    click_on "Back"
  end

  test "should destroy Fauna" do
    visit fauna_url(@fauna)
    click_on "Destroy this fauna", match: :first

    assert_text "Fauna was successfully destroyed"
  end
end
