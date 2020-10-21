# frozen_string_literal: true

# greetings_controller_test.rb
module V1
  class GreetingsControllerTest < ActionDispatch::IntegrationTest
    test 'should get a hello world message' do
      get v1_hello_url
      assert_response :success

      body = JSON.parse response.body

      assert_equal body['message'], 'Hello, World'
    end
  end
end
