class ScoresReportController < ApplicationController
  def index
    if not query_params[:touchpoint].present?
      render json: {error: "Touchpoint parameter missing"}, status: :unprocessable_entity and return
    end
    render json: Score.find_by(query_params), status: :ok
  end

  private
    def query_params
      params.require(:score).permit(:touchpoint,:respondent_class, :object_class)
    end
end
