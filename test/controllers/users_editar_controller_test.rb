require 'test_helper'

class UsersEditarControllerTest < ActionController::TestCase
  test "should get empresa" do
    get :empresa
    assert_response :success
  end

  test "should get encargado" do
    get :encargado
    assert_response :success
  end

  test "should get rubros" do
    get :rubros
    assert_response :success
  end

  test "should get clave" do
    get :clave
    assert_response :success
  end

end
