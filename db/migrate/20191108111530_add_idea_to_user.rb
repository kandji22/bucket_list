class AddIdeaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :idea, :reference
  end
end
