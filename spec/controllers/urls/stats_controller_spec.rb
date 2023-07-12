# frozen_string_literal: true

RSpec.describe Urls::StatsController do
  describe 'GET /urls/:short_url/stats' do
    subject(:do_request) { get :index, params: { short_url: slug } }

    context 'when URL exists' do
      let(:url) { create(:url) }
      let(:slug) { url.slug }

      it 'returns URL path' do
        do_request

        expect(response).to be_ok
        expect(response.body).to match_json_schema('url_stats')
      end
    end

    context 'when URL doesnt exist' do
      let(:slug) { generate(:string) }

      it 'returns not found' do
        do_request

        expect(response).to be_not_found
      end
    end
  end
end
