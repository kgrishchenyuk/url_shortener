# frozen_string_literal: true

RSpec.describe Url, type: :model do
  describe 'validations' do
    it { is_expected.to allow_value('https://foo.bar').for(:path) }
    it { is_expected.not_to allow_value('xyz://foo.bar').for(:path) }
  end
end
