require "test_helper"

class BombasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bomba = bombas(:one)
  end

  test "should get index" do
    get bombas_url
    assert_response :success
  end

  test "should get new" do
    get new_bomba_url
    assert_response :success
  end

  test "should create bomba" do
    assert_difference('Bomba.count') do
      post bombas_url, params: { bomba: { coordenadas: @bomba.coordenadas, descripcion: @bomba.descripcion } }
    end

    assert_redirected_to bomba_url(Bomba.last)
  end

  test "should show bomba" do
    get bomba_url(@bomba)
    assert_response :success
  end

  test "should get edit" do
    get edit_bomba_url(@bomba)
    assert_response :success
  end

  test "should update bomba" do
    patch bomba_url(@bomba), params: { bomba: { coordenadas: @bomba.coordenadas, descripcion: @bomba.descripcion } }
    assert_redirected_to bomba_url(@bomba)
  end

  test "should destroy bomba" do
    assert_difference('Bomba.count', -1) do
      delete bomba_url(@bomba)
    end

    assert_redirected_to bombas_url
  end
end
