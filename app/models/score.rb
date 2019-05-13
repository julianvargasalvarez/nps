class Score < ApplicationRecord
  validates :touchpoint, uniqueness: { scope: [:respondent_class, :respondent_id, :object_class, :object_id]}
end
