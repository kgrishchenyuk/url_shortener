# frozen_string_literal: true

Rails.application.routes.draw do
  resources :urls, param: :short_url, only: [:create, :show] do
    member do
      resources :stats, only: :index, controller: 'urls/stats', as: :url_stats
    end
  end
end
