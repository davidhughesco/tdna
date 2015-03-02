json.array!(@needs_analyses) do |needs_analysis|
  json.extract! needs_analysis, :id, :candidate_id, :collaborator_id, :activity_id, :area_id, :order_id, :relevance, :interest, :skill, :current_relevance, :future_relevance
  json.url needs_analysis_url(needs_analysis, format: :json)
end
