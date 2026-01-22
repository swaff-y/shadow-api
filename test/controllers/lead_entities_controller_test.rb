require "test_helper"

class LeadEntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lead_entity = lead_entities(:one)
  end

  test "should get index" do
    get lead_entities_url, as: :json
    assert_response :success
  end

  test "should create lead_entity" do
    assert_difference("LeadEntity.count") do
      post lead_entities_url, params: { lead_entity: { entity_type: @lead_entity.entity_type, status: @lead_entity.status } }, as: :json
    end

    assert_response :created
  end

  test "should show lead_entity" do
    get lead_entity_url(@lead_entity), as: :json
    assert_response :success
  end

  test "should update lead_entity" do
    patch lead_entity_url(@lead_entity), params: { lead_entity: { entity_type: @lead_entity.entity_type, status: @lead_entity.status } }, as: :json
    assert_response :success
  end

  test "should destroy lead_entity" do
    assert_difference("LeadEntity.count", -1) do
      delete lead_entity_url(@lead_entity), as: :json
    end

    assert_response :no_content
  end
end
