class DashboardController < ApplicationController
  def index
  end

  def query
    puts "PARAMS: #{params.inspect}"
    respond_to do |format|
      format.json { render json: { answer: "Question: #{params[:question]}, Source: #{params[:source]}" } }
    end
  end

  # TODO: Add strong parameters

end
