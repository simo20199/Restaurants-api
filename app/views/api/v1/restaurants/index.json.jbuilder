# frozen_string_literal: true

json.restaurant do
  json.array! @restaurants do |restaurant|
    json.id restaurant.id
    json.name restaurant.name
    json.address restaurant.address
  end
end
# json.id @restaurant.id
# json.name @restaurant.name
# json.address @restaurant.address
# json.comments @restaurant.comments do |comment|
#   json.id comment.id
#   json.content comment.id
# end

# json.array! @restaurants do |restaurant|
#   json.extract! restaurant, :id, :name, :address
# end
