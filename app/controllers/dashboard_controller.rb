class DashboardController < ApplicationController
  def index
  end

  def query
    open_ai_completion
    puts "PARAMS: #{params.inspect}"
    respond_to do |format|
      format.json { render json: { answer: "Question: #{params[:question]}, Source: #{params[:source]}" } }
    end
  end

  private

  # TODO: Add strong parameters

  def open_ai_client
    @client ||= OpenAI::Client.new(access_token: ENV.fetch('OPEN_AI_KEY'))
  end

  def open_ai_completion
    response = open_ai_client.completions(
      parameters: {
          model: "text-ada-001",
          prompt: "Once upon a time",
          max_tokens: 5
      })
    puts response
    # puts response["choices"].map { |c| c["text"] }
  end
end
