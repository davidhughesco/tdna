require 'test_helper'

class NeedsAnalysesControllerTest < ActionController::TestCase
  setup do
    @needs_analysis = needs_analyses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:needs_analyses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create needs_analysis" do
    assert_difference('NeedsAnalysis.count') do
      post :create, needs_analysis: { activity_id: @needs_analysis.activity_id, area_id: @needs_analysis.area_id, candidate_id: @needs_analysis.candidate_id, collaborator_id: @needs_analysis.collaborator_id, current_relevance: @needs_analysis.current_relevance, future_relevance: @needs_analysis.future_relevance, interest: @needs_analysis.interest, order_id: @needs_analysis.order_id, relevance: @needs_analysis.relevance, skill: @needs_analysis.skill }
    end

    assert_redirected_to needs_analysis_path(assigns(:needs_analysis))
  end

  test "should show needs_analysis" do
    get :show, id: @needs_analysis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @needs_analysis
    assert_response :success
  end

  test "should update needs_analysis" do
    patch :update, id: @needs_analysis, needs_analysis: { activity_id: @needs_analysis.activity_id, area_id: @needs_analysis.area_id, candidate_id: @needs_analysis.candidate_id, collaborator_id: @needs_analysis.collaborator_id, current_relevance: @needs_analysis.current_relevance, future_relevance: @needs_analysis.future_relevance, interest: @needs_analysis.interest, order_id: @needs_analysis.order_id, relevance: @needs_analysis.relevance, skill: @needs_analysis.skill }
    assert_redirected_to needs_analysis_path(assigns(:needs_analysis))
  end

  test "should destroy needs_analysis" do
    assert_difference('NeedsAnalysis.count', -1) do
      delete :destroy, id: @needs_analysis
    end

    assert_redirected_to needs_analyses_path
  end
end
