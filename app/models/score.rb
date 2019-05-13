class Score < ApplicationRecord
  validates :score, :touchpoint, :respondent_class, :respondent_id, :object_class, :object_id, presence: true
  validates :score, :inclusion => {:in => (0..10), message: "Score must be between 0 and 10"}
end
