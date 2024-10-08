require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "creating a Cliente" do
    visit clientes_url
    click_on "New Cliente"

    fill_in "Bomba", with: @cliente.bomba_id
    fill_in "Nombre", with: @cliente.nombre
    fill_in "Razon social", with: @cliente.razon_social
    fill_in "Ruc", with: @cliente.ruc
    click_on "Create Cliente"

    assert_text "Cliente was successfully created"
    click_on "Back"
  end

  test "updating a Cliente" do
    visit clientes_url
    click_on "Edit", match: :first

    fill_in "Bomba", with: @cliente.bomba_id
    fill_in "Nombre", with: @cliente.nombre
    fill_in "Razon social", with: @cliente.razon_social
    fill_in "Ruc", with: @cliente.ruc
    click_on "Update Cliente"

    assert_text "Cliente was successfully updated"
    click_on "Back"
  end

  test "destroying a Cliente" do
    visit clientes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cliente was successfully destroyed"
  end
end
