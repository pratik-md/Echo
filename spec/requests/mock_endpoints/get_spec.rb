require 'rails_helper'

RSpec.describe 'MockEndpoints', type: :request do
  describe '.all' do
    let!(:path) { endpoints_path }
    let!(:get_header) { json_api_accept_header }
    let!(:post_params) { sample_post_params }
    let!(:post_headers) { json_api_headers }

    context "without available mock endpoints" do
      before do
        get path, headers: get_header
      end

      it "will return status 'ok'" do
        expect(response).to have_http_status(:ok)
      end

      it "will return an empty array" do
        expect(response_body).to match_array([])
      end
    end

    context "with available mock endpoints" do
      before do
        post path, params: post_params, headers: post_headers
        get path, headers: get_header
      end
      
      it "will return status 'ok'" do
        expect(response).to have_http_status(:ok)
      end

      it "will return a non-empty array" do
        expect(response_body).to be_an_instance_of(Array)
        expect(response_body).to_not be_empty
      end
    end
  end
end