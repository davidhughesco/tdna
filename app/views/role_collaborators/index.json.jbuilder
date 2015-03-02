json.array!(@role_collaborators) do |role_collaborator|
  json.extract! role_collaborator, :id, :candidate_id, :collaborator_id, :current_role, :next_role, :current_role_context, :next_role_context, :main_aspect_1, :main_aspect_2, :main_aspect_3, :main_aspect_4, :main_aspect_5
  json.url role_collaborator_url(role_collaborator, format: :json)
end
