module V1
  class GreetingsController < ApplicationController
    def show
      render json: 'Hello, World'
    end
  end
end
