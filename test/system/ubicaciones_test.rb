require "application_system_test_case"

class UbicacionesTest < ApplicationSystemTestCase
  setup do
    @ubicacione = ubicaciones(:one)
  end

  test "visiting the index" do
    visit ubicaciones_url
    assert_selector "h1", text: "Ubicaciones"
  end

  test "creating a Ubicacione" do
    visit ubicaciones_url
    click_on "New Ubicacione"

    fill_in "Ciudad", with: @ubicacione.ciudad_id
    fill_in "Direccion", with: @ubicacione.direccion
    fill_in "Pais", with: @ubicacione.pais_id
    click_on "Create Ubicacione"

    assert_text "Ubicacione was successfully created"
    click_on "Back"
  end

  test "updating a Ubicacione" do
    visit ubicaciones_url
    click_on "Edit", match: :first

    fill_in "Ciudad", with: @ubicacione.ciudad_id
    fill_in "Direccion", with: @ubicacione.direccion
    fill_in "Pais", with: @ubicacione.pais_id
    click_on "Update Ubicacione"

    assert_text "Ubicacione was successfully updated"
    click_on "Back"
  end

  test "destroying a Ubicacione" do
    visit ubicaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ubicacione was successfully destroyed"
  end
end
