require 'rails_helper'

RSpec.describe 'MockEndpoints', type: :request do
  describe '.destroy' do
    let!(:post_path) { endpoints_path }
    let!(:post_params) { sample_post_params }
    let!(:post_headers) { json_api_headers }
    let!(:delete_header) { json_api_accept_header }
    
    let!(:mock_endpoint_id) { 
      post post_path, params: post_params, headers: post_headers
      response_body.dig('data', 'id').to_i
    }

    context "when specified mock endpoint exists" do
      before do
        @initial_endpoints_count = MockEndpoint.count
        delete "/v1/endpoints/#{mock_endpoint_id}", headers: delete_header
        @final_endpoints_count = MockEndpoint.count
      end

      it "will delete the record" do
        expect(@initial_endpoints_count - @final_endpoints_count).to eq(1)
      end

      it "will return 'no content' response code" do
        expect(response).to have_http_status(:no_content)
      end

      it "will return an empty body" do
        expect(response.body).to be_empty
      end
    end

    context "when specified mock endpoint does not exist" do
      before do
        @initial_endpoints_count = MockEndpoint.count
        delete "/v1/endpoints/#{mock_endpoint_id + 1}", headers: delete_header
        @final_endpoints_count = MockEndpoint.count
      end

      it "will not delete the record" do
        expect(@initial_endpoints_count - @final_endpoints_count).to eq(0)
      end

      it "will return 'not found' error code" do
        expect(response).to have_http_status(:not_found)
      end
    end    
  end
end