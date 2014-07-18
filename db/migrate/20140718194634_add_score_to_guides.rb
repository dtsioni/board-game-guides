class AddScoreToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :score, :integer
  end
end
