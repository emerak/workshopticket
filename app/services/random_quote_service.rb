# frozen_string_literal: true

require 'net/http'

class RandomQuoteService
  API_ENDPOINT = 'https://programming-quotes-api.herokuapp.com/quotes/random'

  def call
    uri = URI(API_ENDPOINT)

    response = Net::HTTP.get(uri)

    OpenStruct.new({ success?: true, response: response })
  rescue StandardError => e
    OpenStruct.new({ success?: false, error: e.message })
  end
end
