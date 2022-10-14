RSpec.describe 'MockEndpoints', type: :request do
  describe '.update' do
    let!(:post_path) { endpoints_path }
    let!(:post_params) { sample_post_params }
    let!(:headers) { json_api_headers }
    let!(:updated_attributes) { 
      {
        "verb": "POST",
        "path": "/introduction",
        "response": {
          "code": 201,
          "headers": {},
          "body": "Hello"
        }
      }
    }
    let!(:mock_endpoint_id) { 
      post post_path, params: post_params, headers: headers
      response_body.dig('data', 'id').to_i
    }

    context "when specified mock endpoint exists" do
      before do
        patch "/v1/endpoints/#{mock_endpoint_id}", params: {
          "data": {
            "type": "endpoints",
            "id": mock_endpoint_id.to_s,
            "attributes": updated_attributes
          }
        }.to_json, headers: headers
      end

      it "will respond with status 'ok'" do
        expect(response).to have_http_status(:ok)
      end

      it "will update the mock endpoint with data provided" do
        expect(response_body.dig('data', 'attributes')).to eq(updated_attributes.deep_stringify_keys)
      end

      it "will respond with 'Content-Type: application/vnd.api+json'" do
        expect(response.headers["Content-Type"]).to eq ('application/vnd.api+json')
      end
    end

    context "when specified mock endpoint does not exist" do
      before do
        non_existing_endpoint_id = mock_endpoint_id + 1
        patch "/v1/endpoints/#{non_existing_endpoint_id}", params: {
          "data": {
            "type": "endpoints",
            "id": non_existing_endpoint_id.to_s,
            "attributes": updated_attributes
          }
        }.to_json, headers: headers
      end

      it "will not update the mock endpoint with data provided" do
        expect(response_body.dig('data', 'attributes')).to_not eq(updated_attributes.deep_stringify_keys)
      end

      it "will return 'not found' error code" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when IDs in request URL and body do not match" do
      before do
        patch "/v1/endpoints/#{mock_endpoint_id}", params: {
          "data": {
            "type": "endpoints",
            "id": (mock_endpoint_id + 1).to_s,
            "attributes": updated_attributes
          }
        }.to_json, headers: headers
      end

      it "will not update the mock endpoint with data provided" do
        expect(response_body.dig('data', 'attributes')).to_not eq(updated_attributes.deep_stringify_keys)
      end

      it "will return 'not found' error code" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end