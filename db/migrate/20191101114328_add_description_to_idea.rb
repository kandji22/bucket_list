class AddDescriptionToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :migration, :string
  end
end
