# frozen_string_literal: true

# frozen_string_literal: true.
require 'net/http'
require 'test_helper'

class RandomQuoteServiceTest < MiniTest::Test
  def test_fetches_quote_successfully
    api_response = {
      _id: '5a91e37bc4240c0004265955',
      en: "Young man, in mathematics you don't understand things. You just get used to them.",
      author: 'John von Neumann',
      id: '5a91e37bc4240c0004265955'
    }

    Net::HTTP.stubs(:get).returns(api_response)

    subject = RandomQuoteService.new
    result = subject.call

    assert result.success?
    assert_equal result.response[:en], api_response[:en]
  end

  def test_errors_when_fetching_quote
    Net::HTTP.stubs(:get).raises(StandardError.new('Spectacular fail'))
    subject = RandomQuoteService.new
    result = subject.call

    refute result.success?
    assert_equal result.error, 'Spectacular fail'
  end
end
