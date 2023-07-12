# frozen_string_literal: true

FactoryBot.define do
  sequence(:string) { |n| "string#{n}" }
  sequence(:path) { |n| "https://path#{n}.com" }
  sequence(:slug) { SecureRandom.alphanumeric(8) }
end
