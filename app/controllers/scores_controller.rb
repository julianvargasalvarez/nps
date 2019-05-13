class ScoresController < ApplicationController

  def create
    score = Score.find_or_initialize_by(score_params.except(:score))
    score.score = score_params[:score]

    if score.save
      render json: score, status: :created
    else
      render json: score.errors, status: :unprocessable_entity
    end
  end

  private
    def score_params
      params.require(:score).permit(:score, :touchpoint, :respondent_class, :respondent_id, :object_class, :object_id)
    end
end
