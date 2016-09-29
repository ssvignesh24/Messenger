require 'test_helper'

class MessengerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get messenger_create_url
    assert_response :success
  end

  test "should get sent" do
    get messenger_sent_url
    assert_response :success
  end

  test "should get fetch" do
    get messenger_fetch_url
    assert_response :success
  end

end
