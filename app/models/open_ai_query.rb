class OpenAiQuery
  def initialize(question:, source:)
    @question = question
    @source = source
  end

  def answer
    return api_response["choices"].first["text"]
  end

  private

  def open_ai_client
    @client ||= OpenAI::Client.new(access_token: ENV.fetch('OPEN_AI_KEY'))
  end

  def api_response
    open_ai_client.completions(
      parameters: {
          model: "text-ada-001",
          prompt: "Once upon a time",
          max_tokens: 5
      })
    # puts response["choices"].map { |c| c["text"] }
    # SAMPLE RESPONSE: {"id":"cmpl-6jjZCqrZxGcvxdz2iV3c41Sb0VNua","object":"text_completion","created":1676357938,"model":"text-ada-001","choices":[{"text":" there was a small cottage","index":0,"logprobs":null,"finish_reason":"length"}],"usage":{"prompt_tokens":4,"completion_tokens":5,"total_tokens":9}}
  end

end