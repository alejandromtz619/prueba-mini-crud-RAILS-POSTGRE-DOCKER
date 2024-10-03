require "test_helper"

class UbicacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ubicacione = ubicaciones(:one)
  end

  test "should get index" do
    get ubicaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_ubicacione_url
    assert_response :success
  end

  test "should create ubicacione" do
    assert_difference('Ubicacione.count') do
      post ubicaciones_url, params: { ubicacione: { ciudad_id: @ubicacione.ciudad_id, direccion: @ubicacione.direccion, pais_id: @ubicacione.pais_id } }
    end

    assert_redirected_to ubicacione_url(Ubicacione.last)
  end

  test "should show ubicacione" do
    get ubicacione_url(@ubicacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_ubicacione_url(@ubicacione)
    assert_response :success
  end

  test "should update ubicacione" do
    patch ubicacione_url(@ubicacione), params: { ubicacione: { ciudad_id: @ubicacione.ciudad_id, direccion: @ubicacione.direccion, pais_id: @ubicacione.pais_id } }
    assert_redirected_to ubicacione_url(@ubicacione)
  end

  test "should destroy ubicacione" do
    assert_difference('Ubicacione.count', -1) do
      delete ubicacione_url(@ubicacione)
    end

    assert_redirected_to ubicaciones_url
  end
end
