# frozen_string_literal: true

RSpec::Matchers.define :match_json_schema do |schema|
  match do |json|
    schema_directory = Rails.root.join('spec/support/json_schemas').to_s
    schema_path = "#{schema_directory}/#{schema}.json"

    JSON::Validator.validate!(schema_path, json)
  end
end
