# frozen_string_literal: true

class AddUsernameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
  end
end
