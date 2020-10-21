module V1
  class QuotesController < ApplicationController
    def show
      result = RandomQuoteService.new.call

      if result.success?
        render json: result.response
      else
        render json: result.error, status: :unprocessable_entity
      end
    end
  end
end
