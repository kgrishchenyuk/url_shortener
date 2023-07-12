# frozen_string_literal: true

module Urls
  class StatsController < Urls::ApplicationController
    def index
      render json: url, serializer: UrlStatsSerializer, root: :url, adapter: :json
    end
  end
end
