require "test_helper"

class CarPartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_part_index_url
    assert_response :success
  end

  test "should get show" do
    get car_part_show_url
    assert_response :success
  end
end
