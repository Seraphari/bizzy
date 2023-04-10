
if @toggle_favorite.persisted?
  json.form render(partial: "toggle_favorites/form", formats: :html, locals: {investor: @investor, toggle_favorite: Favorite.new})
  json.inserted_item render(partial: "investors/investor", formats: :html, locals: {toggle_favorite: @investor})
else
  json.form render(partial: "toggle_favorites/form", formats: :html, locals: {restaurant: @restaurant, review: @review})
end
