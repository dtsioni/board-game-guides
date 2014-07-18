class AddScoreToResources < ActiveRecord::Migration
  def change
    add_column :resources, :score, :integer
  end
end
