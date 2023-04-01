# frozen_string_literal: true

class Favorite < ApplicationRecord
  extend ActsAsFavoritor::FavoriteScopes

  belongs_to :favoritable, polymorphic: true
  belongs_to :favoritor, polymorphic: true

  # Favoritor.configure do |config|
  #   config.default_scope = :follow
  # end

  def block!
    update!(blocked: true)
  end
end
