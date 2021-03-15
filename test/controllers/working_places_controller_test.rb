require 'test_helper'

class WorkingPlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get working_places_new_url
    assert_response :success
  end

  test "should get show" do
    get working_places_show_url
    assert_response :success
  end

  test "should get create" do
    get working_places_create_url
    assert_response :success
  end

  test "should get update" do
    get working_places_update_url
    assert_response :success
  end

  test "should get delete" do
    get working_places_delete_url
    assert_response :success
  end

end
