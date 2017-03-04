require 'test_helper'

class BloodSugarLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blood_sugar_level = blood_sugar_levels(:one)
  end

  test "should get index" do
    get blood_sugar_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_blood_sugar_level_url
    assert_response :success
  end

  test "should create blood_sugar_level" do
    assert_difference('BloodSugarLevel.count') do
      post blood_sugar_levels_url, params: { blood_sugar_level: {  } }
    end

    assert_redirected_to blood_sugar_level_url(BloodSugarLevel.last)
  end

  test "should show blood_sugar_level" do
    get blood_sugar_level_url(@blood_sugar_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_blood_sugar_level_url(@blood_sugar_level)
    assert_response :success
  end

  test "should update blood_sugar_level" do
    patch blood_sugar_level_url(@blood_sugar_level), params: { blood_sugar_level: {  } }
    assert_redirected_to blood_sugar_level_url(@blood_sugar_level)
  end

  test "should destroy blood_sugar_level" do
    assert_difference('BloodSugarLevel.count', -1) do
      delete blood_sugar_level_url(@blood_sugar_level)
    end

    assert_redirected_to blood_sugar_levels_url
  end
end
