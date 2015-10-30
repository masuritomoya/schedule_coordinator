json.array!(@members) do |member|
  json.extract! member, :id, :group_id, :email
  json.url member_url(member, format: :json)
end
