# frozen_string_literal: true

module Urls
  class Create
    class UniqueSlugCreationError < StandardError; end

    extend Dry::Initializer
    extend Callable

    option :path, Types::Strict::String.constrained(format: /\Ahttps?:\/\//)

    def call
      build_url.tap(&method(:save_url))
    end

    private

    def build_url
      Url.new(path: path, slug: build_slug)
    end

    def build_slug
      SecureRandom.alphanumeric(8)
    end

    def save_url(url)
      100.times do
        return if url.save

        url.slug = build_slug
      end

      raise UniqueSlugCreationError
    end
  end
end
