class DashboardController < ApplicationController
  def index
  end

  def query
    result = OpenAiQuery.new(question: params[:question], source: params[:source]).answer
    puts "PARAMS: #{params.inspect}"
    respond_to do |format|
      format.json { render json: { answer: result } }
    end
  end

  private

  # TODO: Add strong parameters
end
