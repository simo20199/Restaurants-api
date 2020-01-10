# frozen_string_literal: true

class AddUserToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :user, null: true, foreign_key: true
  end
end
