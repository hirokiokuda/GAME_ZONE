require "test_helper"

class Public::GameCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_game_comments_index_url
    assert_response :success
  end

  test "should get update" do
    get public_game_comments_update_url
    assert_response :success
  end

  test "should get create" do
    get public_game_comments_create_url
    assert_response :success
  end
end
