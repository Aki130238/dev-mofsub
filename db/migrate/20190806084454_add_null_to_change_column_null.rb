class AddNullToChangeColumnNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :housings, :build, false
    change_column_null :housings, :rent, false
    change_column_null :housings, :add, false
    change_column_null :housings, :year, false
    change_column_null :housings, :remarks, false
  end
end
