class AddSearchPresent < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_present, :boolean, default: false
  end
end
