# frozen_string_literal: true

module V1
  class GreetingsController < ApplicationController
    def show
      render json: { message: 'Hello, World' }
    end
  end
end
