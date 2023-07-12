# frozen_string_literal: true

FactoryBot.define do
  factory :url do
    path { generate(:path) }
    slug { generate(:slug) }
  end
end
