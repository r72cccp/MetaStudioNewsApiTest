require 'test_helper'

class AgeCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @age_category = age_categories(:one)
  end

  test "should get index" do
    get age_categories_url, as: :json
    assert_response :success
  end

  test "should create age_category" do
    assert_difference('AgeCategory.count') do
      post age_categories_url, params: { age_category: { index: @age_category.index, name: @age_category.name, weight: @age_category.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show age_category" do
    get age_category_url(@age_category), as: :json
    assert_response :success
  end

  test "should update age_category" do
    patch age_category_url(@age_category), params: { age_category: { index: @age_category.index, name: @age_category.name, weight: @age_category.weight } }, as: :json
    assert_response 200
  end

  test "should destroy age_category" do
    assert_difference('AgeCategory.count', -1) do
      delete age_category_url(@age_category), as: :json
    end

    assert_response 204
  end
end
