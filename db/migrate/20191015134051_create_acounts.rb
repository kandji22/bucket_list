class CreateAcounts < ActiveRecord::Migration[5.1]
  def change
    create_table :acounts do |t|
      t.string :title
      t.string :src

      t.timestamps
    end
  end
end
