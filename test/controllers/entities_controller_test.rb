require 'test_helper'

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity = entities(:one)
  end

  test "should get index" do
    get entities_url
    assert_response :success
  end

  test "should get new" do
    get new_entity_url
    assert_response :success
  end

  test "should create entity" do
    assert_difference('Entity.count') do
      post entities_url, params: { entity: { age: @entity.age, current_resident_country: @entity.current_resident_country, dob: @entity.dob, education_specialization: @entity.education_specialization, employer: @entity.employer, name: @entity.name, place_of_birth: @entity.place_of_birth } }
    end

    assert_redirected_to entity_url(Entity.last)
  end

  test "should show entity" do
    get entity_url(@entity)
    assert_response :success
  end

  test "should get edit" do
    get edit_entity_url(@entity)
    assert_response :success
  end

  test "should update entity" do
    patch entity_url(@entity), params: { entity: { age: @entity.age, current_resident_country: @entity.current_resident_country, dob: @entity.dob, education_specialization: @entity.education_specialization, employer: @entity.employer, name: @entity.name, place_of_birth: @entity.place_of_birth } }
    assert_redirected_to entity_url(@entity)
  end

  test "should destroy entity" do
    assert_difference('Entity.count', -1) do
      delete entity_url(@entity)
    end

    assert_redirected_to entities_url
  end
end
