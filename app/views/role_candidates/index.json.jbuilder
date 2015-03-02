json.array!(@role_candidates) do |role_candidate|
  json.extract! role_candidate, :id, :candidate_id, :current_role, :time_in_role, :previous_role, :next_role, :qualifications, :previous_role_context, :current_role_context, :next_role_context, :main_aspect_a, :main_aspect_b, :main_aspect_c, :main_aspect_d, :main_aspect_e, :main_aspect_importance_a, :main_aspect_importance_b, :main_aspect_importance_c, :main_aspect_importance_d, :main_aspect_importance_e, :main_aspect_enjoyment_a, :main_aspect_enjoyment_b, :main_aspect_enjoyment_c, :main_aspect_enjoyment_d, :main_aspect_enjoyment_e, :secondary_aspect, :unnecessary_aspect, :short_term_training, :medium_term_training, :long_term_training
  json.url role_candidate_url(role_candidate, format: :json)
end
