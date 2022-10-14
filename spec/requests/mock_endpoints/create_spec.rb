require 'rails_helper'

RSpec.describe 'MockEndpoint', type: :request do
  describe '.create' do
    let!(:path) { endpoints_path }
    let!(:params) { sample_post_params }
    let!(:headers) { json_api_headers }

    subject {
      post path, params: params, headers: headers
    }

    context "With valid request parameters" do
      it "will create a new mock endpoint" do
        expect {subject}.to change(MockEndpoint, :count).by(1)
        expect(response).to have_http_status(:created)
      end

      it "will respond with apt Location and Content-Type headers" do
        subject
        expect([response.headers["Content-Type"], response.headers["Location"]]).to eq ["application/vnd.api+json", "http://www.example.com/v1/greeting"]
      end
    end

    context "With invalid request headers" do
      before do
        post path, params: params, headers: { "Accept": "application/json", "Content-Type": "application/json" }
      end

      it "will return 'unsupported media type' error" do
        expect(response).to have_http_status(:unsupported_media_type)
      end
    end

    context "When creating a mock endpoint that already exists" do
      before do
        post path, params: params, headers: headers
      end

      it "will return a validation error with error code 422" do
        expect {subject}.to_not change(MockEndpoint, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end