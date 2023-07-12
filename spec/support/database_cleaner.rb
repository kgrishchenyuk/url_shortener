# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction
  end

  config.around(:each, db_cleaning: :deletion) do |example|
    current_strategy = DatabaseCleaner[:active_record].strategy
    current_using_transactional_tests = use_transactional_tests

    self.use_transactional_tests = false
    DatabaseCleaner[:active_record].strategy = :deletion

    example.run

    self.use_transactional_tests = current_using_transactional_tests
    DatabaseCleaner[:active_record].strategy = current_strategy
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
