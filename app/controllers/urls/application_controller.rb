# frozen_string_literal: true

class Urls::ApplicationController < ApplicationController
  private

  def url
    @url ||= Url.find_by!(slug: params[:short_url])
  end
end
