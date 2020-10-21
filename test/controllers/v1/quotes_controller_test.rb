# frozen_string_literal: true

# quotes_controller_test.rb

require 'test_helper'

module V1
  class QuotesControllerTest < ActionDispatch::IntegrationTest
    test 'should get a random quote' do
      result = OpenStruct.new({
                                success?: true,
                                response: {
                                  _id: '5a91e37bc4240c0004265955',
                                  en: "Young man, in mathematics you don't understand things. You just get used to them.",
                                  author: 'John von Neumann',
                                  id: '5a91e37bc4240c0004265955'
                                }
                              })

      RandomQuoteService.any_instance.stubs(:call).returns(result)

      # /v1/quotes
      get v1_quotes_url

      assert_response :success

      body = JSON.parse response.body

      assert_equal body['author'], result.response[:author]
      assert_equal body['en'], result.response[:en]
      assert_equal body['_id'], result.response[:_id]
      assert_equal body['id'], result.response[:id]
    end

    test 'should handle api errors' do
      result = OpenStruct.new({
                                success?: false,
                                error: 'Spectacular fail'
                              })

      RandomQuoteService.any_instance.stubs(:call).returns(result)
      # /v1/quotes
      get v1_quotes_url

      assert_response :unprocessable_entity

      body = JSON.parse response.body

      assert_equal body['error'], result.error
    end
  end
end
