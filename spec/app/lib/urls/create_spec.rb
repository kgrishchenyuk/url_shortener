# frozen_string_literal: true

RSpec.describe Urls::Create do
  subject(:create_url) { described_class.call(path: path) }

  let(:path) { generate(:path) }

  specify do
    expect(create_url).to have_attributes(path: path)
  end
end
