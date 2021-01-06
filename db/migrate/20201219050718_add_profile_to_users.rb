# frozen_string_literal: true

class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :postcode, :string, limit: 7
    add_column :users, :address, :text
    add_column :users, :biography, :text
  end
end
