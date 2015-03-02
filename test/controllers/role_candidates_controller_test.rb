require 'test_helper'

class RoleCandidatesControllerTest < ActionController::TestCase
  setup do
    @role_candidate = role_candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_candidate" do
    assert_difference('RoleCandidate.count') do
      post :create, role_candidate: { candidate_id: @role_candidate.candidate_id, current_role: @role_candidate.current_role, current_role_context: @role_candidate.current_role_context, long_term_training: @role_candidate.long_term_training, main_aspect_a: @role_candidate.main_aspect_a, main_aspect_b: @role_candidate.main_aspect_b, main_aspect_c: @role_candidate.main_aspect_c, main_aspect_d: @role_candidate.main_aspect_d, main_aspect_e: @role_candidate.main_aspect_e, main_aspect_enjoyment_a: @role_candidate.main_aspect_enjoyment_a, main_aspect_enjoyment_b: @role_candidate.main_aspect_enjoyment_b, main_aspect_enjoyment_c: @role_candidate.main_aspect_enjoyment_c, main_aspect_enjoyment_d: @role_candidate.main_aspect_enjoyment_d, main_aspect_enjoyment_e: @role_candidate.main_aspect_enjoyment_e, main_aspect_importance_a: @role_candidate.main_aspect_importance_a, main_aspect_importance_b: @role_candidate.main_aspect_importance_b, main_aspect_importance_c: @role_candidate.main_aspect_importance_c, main_aspect_importance_d: @role_candidate.main_aspect_importance_d, main_aspect_importance_e: @role_candidate.main_aspect_importance_e, medium_term_training: @role_candidate.medium_term_training, next_role: @role_candidate.next_role, next_role_context: @role_candidate.next_role_context, previous_role: @role_candidate.previous_role, previous_role_context: @role_candidate.previous_role_context, qualifications: @role_candidate.qualifications, secondary_aspect: @role_candidate.secondary_aspect, short_term_training: @role_candidate.short_term_training, time_in_role: @role_candidate.time_in_role, unnecessary_aspect: @role_candidate.unnecessary_aspect }
    end

    assert_redirected_to role_candidate_path(assigns(:role_candidate))
  end

  test "should show role_candidate" do
    get :show, id: @role_candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_candidate
    assert_response :success
  end

  test "should update role_candidate" do
    patch :update, id: @role_candidate, role_candidate: { candidate_id: @role_candidate.candidate_id, current_role: @role_candidate.current_role, current_role_context: @role_candidate.current_role_context, long_term_training: @role_candidate.long_term_training, main_aspect_a: @role_candidate.main_aspect_a, main_aspect_b: @role_candidate.main_aspect_b, main_aspect_c: @role_candidate.main_aspect_c, main_aspect_d: @role_candidate.main_aspect_d, main_aspect_e: @role_candidate.main_aspect_e, main_aspect_enjoyment_a: @role_candidate.main_aspect_enjoyment_a, main_aspect_enjoyment_b: @role_candidate.main_aspect_enjoyment_b, main_aspect_enjoyment_c: @role_candidate.main_aspect_enjoyment_c, main_aspect_enjoyment_d: @role_candidate.main_aspect_enjoyment_d, main_aspect_enjoyment_e: @role_candidate.main_aspect_enjoyment_e, main_aspect_importance_a: @role_candidate.main_aspect_importance_a, main_aspect_importance_b: @role_candidate.main_aspect_importance_b, main_aspect_importance_c: @role_candidate.main_aspect_importance_c, main_aspect_importance_d: @role_candidate.main_aspect_importance_d, main_aspect_importance_e: @role_candidate.main_aspect_importance_e, medium_term_training: @role_candidate.medium_term_training, next_role: @role_candidate.next_role, next_role_context: @role_candidate.next_role_context, previous_role: @role_candidate.previous_role, previous_role_context: @role_candidate.previous_role_context, qualifications: @role_candidate.qualifications, secondary_aspect: @role_candidate.secondary_aspect, short_term_training: @role_candidate.short_term_training, time_in_role: @role_candidate.time_in_role, unnecessary_aspect: @role_candidate.unnecessary_aspect }
    assert_redirected_to role_candidate_path(assigns(:role_candidate))
  end

  test "should destroy role_candidate" do
    assert_difference('RoleCandidate.count', -1) do
      delete :destroy, id: @role_candidate
    end

    assert_redirected_to role_candidates_path
  end
end
