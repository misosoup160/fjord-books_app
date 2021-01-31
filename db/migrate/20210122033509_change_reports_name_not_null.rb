# frozen_string_literal: true

class ChangeReportsNameNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reports, :title, false
  end
end
