class AddRequirementToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :requirement, :text
  end
end
