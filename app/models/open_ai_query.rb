class OpenAiQuery
  MODELS = ["text-ada-001", "text-babbage-001", "text-curie-001", "text-davinci-003"]
  
  def initialize(question:, source:)
    @source = File.read(Rails.root.join('test_sources', 'art_of_war.txt'))
    @question = "What always remains the same in times of conflict?"
  end

  def answer
    puts "API RESPONSE: #{api_response.inspect}"
    return api_response["choices"].first["text"]
  end

  private
  attr_reader :source, :question

  def open_ai_client
    @client ||= OpenAI::Client.new(access_token: ENV.fetch('OPEN_AI_KEY'))
  end

  def api_response
    @api_response ||= open_ai_client.completions(
      parameters: {
          model: MODELS.third, 
          prompt: prompt,
          max_tokens: 300
      })
    # puts response["choices"].map { |c| c["text"] }
    # SAMPLE RESPONSE: {"id":"cmpl-6jjZCqrZxGcvxdz2iV3c41Sb0VNua","object":"text_completion","created":1676357938,"model":"text-ada-001","choices":[{"text":" there was a small cottage","index":0,"logprobs":null,"finish_reason":"length"}],"usage":{"prompt_tokens":4,"completion_tokens":5,"total_tokens":9}}
  end

  def prompt
  <<~HEREDOC
  Here's a list of quotes: #{source}

  Use the most relevant quote without modifying it to answer the following question: #{question}
  HEREDOC
  end
end