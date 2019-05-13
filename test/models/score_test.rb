require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  test "Does not allow the same respondent store multiple scores per touchpoint/object" do
    score = Score.create!(score: 9, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)
    duplicate = Score.new(score: 2, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)
    assert_not duplicate.valid?
  end

  test "Allows the same respondent store multiple scores per touchpoint" do
    score = Score.create!(score: 9, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)
    new_score = Score.new(score: 9, touchpoint: 'seller_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)
    assert new_score.valid?
  end

  test "Allows the same respondent store multiple scores per object" do
    score = Score.create!(score: 9, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)
    new_score = Score.new(score: 9, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 3)
    assert new_score.valid?
  end
end
