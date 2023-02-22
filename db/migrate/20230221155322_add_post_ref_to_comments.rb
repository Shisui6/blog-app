# frozen_string_literal: true

# Add post ref to comments
class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
