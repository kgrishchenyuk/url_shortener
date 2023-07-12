# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Dry::Types::ConstraintError, with: :invalid_params

  private

  def not_found(_)
    http_error(404, 'Not found')
  end

  def invalid_params(exception)
    http_error(400, "Invalid params: #{exception.message}")
  end

  def http_error(code, message)
    status_code = Rack::Utils.status_code(code)

    render(
      json: { error: { code: status_code, message: message } }.to_json,
      status: code,
      content_type: 'application/json'
    )
  end
end
