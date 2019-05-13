class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :score
      t.string :touchpoint
      t.string :respondent_class
      t.integer :respondent_id
      t.string :object_class
      t.integer :object_id
      t.timestamps
    end
    add_index :scores, :touchpoint
  end
end
