# frozen_string_literal: true

class ShortUrlSerializer < ActiveModel::Serializer
  delegate :slug, to: :object

  attributes(:short_url)

  def short_url
    "#{Settings.domain}/#{slug}"
  end
end
