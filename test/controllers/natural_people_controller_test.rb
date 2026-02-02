require "test_helper"

class NaturalPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @natural_person = natural_people(:one)
  end

  test "should get index" do
    get natural_people_url, as: :json
    assert_response :success
  end

  test "should create natural_person" do
    assert_difference("NaturalPerson.count") do
      post natural_people_url, params: { natural_person: { dob: @natural_person.dob, docs_s3_folder: @natural_person.docs_s3_folder, first_name: @natural_person.first_name, last_name: @natural_person.last_name } }, as: :json
    end

    assert_response :created
  end

  test "should show natural_person" do
    get natural_person_url(@natural_person), as: :json
    assert_response :success
  end

  test "should update natural_person" do
    patch natural_person_url(@natural_person), params: { natural_person: { dob: @natural_person.dob, docs_s3_folder: @natural_person.docs_s3_folder, first_name: @natural_person.first_name, last_name: @natural_person.last_name } }, as: :json
    assert_response :success
  end

  test "should destroy natural_person" do
    assert_difference("NaturalPerson.count", -1) do
      delete natural_person_url(@natural_person), as: :json
    end

    assert_response :no_content
  end
end
