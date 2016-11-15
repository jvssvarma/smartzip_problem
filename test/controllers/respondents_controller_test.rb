require 'test_helper'

class RespondentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respondent = respondents(:one)
  end

  test "should get index" do
    get respondents_url
    assert_response :success
  end

  test "should get new" do
    get new_respondent_url
    assert_response :success
  end

  test "should create respondent" do
    assert_difference('Respondent.count') do
      post respondents_url, params: { respondent: { email: @respondent.email, name: @respondent.name, phone_number: @respondent.phone_number, user_id: @respondent.user_id } }
    end

    assert_redirected_to respondent_url(Respondent.last)
  end

  test "should show respondent" do
    get respondent_url(@respondent)
    assert_response :success
  end

  test "should get edit" do
    get edit_respondent_url(@respondent)
    assert_response :success
  end

  test "should update respondent" do
    patch respondent_url(@respondent), params: { respondent: { email: @respondent.email, name: @respondent.name, phone_number: @respondent.phone_number, user_id: @respondent.user_id } }
    assert_redirected_to respondent_url(@respondent)
  end

  test "should destroy respondent" do
    assert_difference('Respondent.count', -1) do
      delete respondent_url(@respondent)
    end

    assert_redirected_to respondents_url
  end
end
