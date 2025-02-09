require "test_helper"

class CommunitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get communities_new_url
    assert_response :success
  end

  test "should get create" do
    get communities_create_url
    assert_response :success
  end

  test "should get inde" do
    get communities_inde_url
    assert_response :success
  end

  test "should get show" do
    get communities_show_url
    assert_response :success
  end
end
