require 'test_helper'

class RecordScoresTest < ActionDispatch::IntegrationTest
  test "A. Initial tracking: creates the score with given params" do
    post scores_url, params: { score: { score: 9, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2} }, as: :json

    assert_response 201
    assert_equal 1, Score.count

    last_score = Score.last
    assert_equal 9, last_score.score
    assert_equal 'realtor_feedback', last_score.touchpoint
    assert_equal 'seller', last_score.respondent_class
    assert_equal 1, last_score.respondent_id
    assert_equal 'realtor', last_score.object_class
    assert_equal 2, last_score.object_id
  end

  test "B. Handling duplicate submissions: updates existing records" do
    score = Score.create!(score: 9, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2)

    post scores_url, params: { score: { score: 2, touchpoint: 'realtor_feedback', respondent_class: 'seller', respondent_id: 1, object_class: 'realtor', object_id: 2} }, as: :json

    assert_response 201
    assert_equal 1, Score.count
    last_score = Score.last
    assert_equal score, last_score
    assert_equal 2, last_score.score
    assert_equal 'realtor_feedback', last_score.touchpoint
    assert_equal 'seller', last_score.respondent_class
    assert_equal 1, last_score.respondent_id
    assert_equal 'realtor', last_score.object_class
    assert_equal 2, last_score.object_id
  end

  test "Handles missing params in the request" do
    post scores_url, params: { score: { score: 2} }, as: :json

    assert_equal({"touchpoint"=>["can't be blank"], "respondent_class"=>["can't be blank"], "respondent_id"=>["can't be blank"], "object_class"=>["can't be blank"], "object_id"=>["can't be blank"]}, response.parsed_body)
    assert_response 422
  end
end
