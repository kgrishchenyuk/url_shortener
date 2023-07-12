# frozen_string_literal: true

RSpec.describe UrlsController do
  describe 'POST /urls' do
    subject(:do_request) { post :create, params: { url: { path: path } } }

    context 'when valid path' do
      let(:path) { generate(:path) }

      it 'returns created' do
        do_request

        expect(response).to be_created
        expect(response.body).to match_json_schema('short_url')
      end
    end

    context 'when invalid path' do
      let(:path) { generate(:string) }

      it 'returns bad request' do
        do_request

        expect(response).to be_bad_request
      end
    end
  end

  describe 'GET /urls/:short_url' do
    subject(:do_request) { get :show, params: { short_url: slug } }

    context 'when URL exists' do
      let(:url) { create(:url) }
      let(:slug) { url.slug }

      it 'returns URL path' do
        do_request

        expect(response).to be_ok
        expect(response.body).to match_json_schema('url')
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
