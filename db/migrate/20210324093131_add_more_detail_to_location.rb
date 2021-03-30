class AddMoreDetailToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :name, :string
    add_column :locations, :sort, :integer
    add_column :locations, :is_hidden, :boolean, default: false
  end
end
