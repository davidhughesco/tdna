require 'test_helper'

class RoleCollaboratorsControllerTest < ActionController::TestCase
  setup do
    @role_collaborator = role_collaborators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_collaborators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_collaborator" do
    assert_difference('RoleCollaborator.count') do
      post :create, role_collaborator: { candidate_id: @role_collaborator.candidate_id, collaborator_id: @role_collaborator.collaborator_id, current_role: @role_collaborator.current_role, current_role_context: @role_collaborator.current_role_context, main_aspect_1: @role_collaborator.main_aspect_1, main_aspect_2: @role_collaborator.main_aspect_2, main_aspect_3: @role_collaborator.main_aspect_3, main_aspect_4: @role_collaborator.main_aspect_4, main_aspect_5: @role_collaborator.main_aspect_5, next_role: @role_collaborator.next_role, next_role_context: @role_collaborator.next_role_context }
    end

    assert_redirected_to role_collaborator_path(assigns(:role_collaborator))
  end

  test "should show role_collaborator" do
    get :show, id: @role_collaborator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_collaborator
    assert_response :success
  end

  test "should update role_collaborator" do
    patch :update, id: @role_collaborator, role_collaborator: { candidate_id: @role_collaborator.candidate_id, collaborator_id: @role_collaborator.collaborator_id, current_role: @role_collaborator.current_role, current_role_context: @role_collaborator.current_role_context, main_aspect_1: @role_collaborator.main_aspect_1, main_aspect_2: @role_collaborator.main_aspect_2, main_aspect_3: @role_collaborator.main_aspect_3, main_aspect_4: @role_collaborator.main_aspect_4, main_aspect_5: @role_collaborator.main_aspect_5, next_role: @role_collaborator.next_role, next_role_context: @role_collaborator.next_role_context }
    assert_redirected_to role_collaborator_path(assigns(:role_collaborator))
  end

  test "should destroy role_collaborator" do
    assert_difference('RoleCollaborator.count', -1) do
      delete :destroy, id: @role_collaborator
    end

    assert_redirected_to role_collaborators_path
  end
end
