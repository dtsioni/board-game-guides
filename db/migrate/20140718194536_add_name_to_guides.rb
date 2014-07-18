class AddNameToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :name, :string
  end
end
