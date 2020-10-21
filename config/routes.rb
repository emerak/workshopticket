# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  api_version(:module => 'V1', :path => {:value => "v1"}) do
    get '/hello', to: 'greetings#show'
    get '/quotes', to: 'quotes#show'
  end
end
