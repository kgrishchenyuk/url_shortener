# frozen_string_literal: true

RSpec.describe Urls::IncrementRedirectCounter do
  subject(:increment_redirect_counter) { described_class.call(url: url) }

  let(:url) { create(:url) }

  specify do
    expect { increment_redirect_counter }.to change(url, :redirect_counter).by(1)
  end
end
