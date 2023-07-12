# frozen_string_literal: true

class UrlsController < ApplicationController
  def create
    shortened_url = Urls::Create.call(path: url_params[:path])

    render json: shortened_url, serializer: ShortUrlSerializer,
      root: :url, adapter: :json, status: :created
  end

  def show
    Urls::IncrementRedirectCounter.call(url: url)

    render json: url, serializer: UrlSerializer, root: :url, adapter: :json
  end

  private

  def url_params
    params.require(:url).permit(:path)
  end

  def url
    @url ||= Url.find_by!(slug: params[:short_url])
  end
end
