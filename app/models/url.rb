# frozen_string_literal: true

class Url < ApplicationRecord
  validates :path, format: { with: /\Ahttps?:\/\//, message: 'must begin with http(s)' }
end

# == Schema Information
#
# Table name: urls
#
#  id               :integer          not null, primary key
#  path             :string           not null
#  slug             :string           not null, indexed
#  redirect_counter :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_urls_on_slug  (slug) UNIQUE
#
