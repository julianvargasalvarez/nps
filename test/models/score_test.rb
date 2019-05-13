require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
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

  test "Validates presence of score" do
    score = Score.new
    assert_not score.valid?
    assert_includes score.errors.messages[:score], "can't be blank"
  end
  test "Validates presence of touchpoint" do
    score = Score.new
    assert_not score.valid?
    assert_includes score.errors.messages[:touchpoint], "can't be blank"
  end
  test "Validates presence of respondent_class" do
    score = Score.new
    assert_not score.valid?
    assert_includes score.errors.messages[:respondent_class], "can't be blank"
  end
  test "Validates presence of respondent_id" do
    score = Score.new
    assert_not score.valid?
    assert_includes score.errors.messages[:respondent_id], "can't be blank"
  end
  test "Validates presence of object_class" do
    score = Score.new
    assert_not score.valid?
    assert_includes score.errors.messages[:object_class], "can't be blank"
  end
  test "Validates presence of object_id" do
    score = Score.new
    assert_not score.valid?
    assert_equal ["can't be blank"], score.errors.messages[:object_id]
    assert_includes score.errors.messages[:object_id], "can't be blank"
  end

  test "Validates score is not less than zero" do
    score = Score.new(score: -1)
    assert_not score.valid?
    assert_includes score.errors.messages[:score], "Score must be between 0 and 10"
  end

  test "Validates score is not greater than ten" do
    score = Score.new(score: 11)
    assert_not score.valid?
    assert_includes score.errors.messages[:score], "Score must be between 0 and 10"
  end
end
