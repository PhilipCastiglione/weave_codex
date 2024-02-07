require "test_helper"

class FaunasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fauna = faunas(:one)
  end

  test "should get index" do
    get faunas_url
    assert_response :success
  end

  test "should get new" do
    get new_fauna_url
    assert_response :success
  end

  test "should create fauna" do
    assert_difference("Fauna.count") do
      post faunas_url, params: { fauna: { name: @fauna.name } }
    end

    assert_redirected_to fauna_url(Fauna.last)
  end

  test "should show fauna" do
    get fauna_url(@fauna)
    assert_response :success
  end

  test "should get edit" do
    get edit_fauna_url(@fauna)
    assert_response :success
  end

  test "should update fauna" do
    patch fauna_url(@fauna), params: { fauna: { name: @fauna.name } }
    assert_redirected_to fauna_url(@fauna)
  end

  test "should destroy fauna" do
    assert_difference("Fauna.count", -1) do
      delete fauna_url(@fauna)
    end

    assert_redirected_to faunas_url
  end
end
