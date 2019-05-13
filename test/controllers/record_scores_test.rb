require 'test_helper'

class RecordScoresTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scores_url, as: :json
    assert_response :success
  end

  test "A. Initial tracking: creates the score with given params" do
    post scores_url, params: { score: { score: 9, touch_point: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2} }, as: :json

    assert_response 201
    assert_equal 1, Score.count
    last_score = Score.last
    assert_equal 9, Score.score
    assert_equal 'realtor_feedback', Score.touch_point
    assert_equal 'seller', Score.respondent_class
    assert_equal 1, Score.respondent_id
    assert_equal 'realtor', Score.object_class
    assert_equal 2, Score.object_id
  end

  test "B. Handling duplicate submissions: updates existing records" do
    score = Score.create!(score: 9, touch_point: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)

    post scores_url, params: { score: { score: 2, touch_point: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2} }, as: :json

    assert_response 201
    assert_equal 1, Score.count
    last_score = Score.last
    assert_equal score, last_score
    assert_equal 2, last_score.score
    assert_equal 'realtor_feedback', last_score.touch_point
    assert_equal 'seller', last_score.respondent_class
    assert_equal 1, last_score.respondent_id
    assert_equal 'realtor', last_score.object_class
    assert_equal 2, last_score.object_id
  end
end