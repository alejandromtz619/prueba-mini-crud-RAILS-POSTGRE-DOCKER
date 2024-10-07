require "application_system_test_case"

class BombasTest < ApplicationSystemTestCase
  setup do
    @bomba = bombas(:one)
  end

  test "visiting the index" do
    visit bombas_url
    assert_selector "h1", text: "Bombas"
  end

  test "creating a Bomba" do
    visit bombas_url
    click_on "New Bomba"

    fill_in "Coordenadas", with: @bomba.coordenadas
    fill_in "Descripcion", with: @bomba.descripcion
    click_on "Create Bomba"

    assert_text "Bomba was successfully created"
    click_on "Back"
  end

  test "updating a Bomba" do
    visit bombas_url
    click_on "Edit", match: :first

    fill_in "Coordenadas", with: @bomba.coordenadas
    fill_in "Descripcion", with: @bomba.descripcion
    click_on "Update Bomba"

    assert_text "Bomba was successfully updated"
    click_on "Back"
  end

  test "destroying a Bomba" do
    visit bombas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bomba was successfully destroyed"
  end
end
