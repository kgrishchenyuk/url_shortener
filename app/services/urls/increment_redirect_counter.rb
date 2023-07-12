# frozen_string_literal: true

module Urls
  class IncrementRedirectCounter
    extend Dry::Initializer
    extend Callable

    option :url, Types.Instance(Url)

    delegate :redirect_counter, to: :url

    def call
      url.update!(redirect_counter: redirect_counter + 1)
    end
  end
end
