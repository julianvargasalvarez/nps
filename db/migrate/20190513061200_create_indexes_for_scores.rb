class CreateIndexesForScores < ActiveRecord::Migration[5.2]
  def change
    add_index :scores, [:touchpoint, :respondent_class, :object_class], name: 'scores_whole_query' # Default name is too long
    add_index :scores, [:touchpoint, :respondent_class]
    add_index :scores, [:touchpoint, :object_class]
  end
end
