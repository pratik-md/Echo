module TestHelpers
  def response_body
    JSON.parse(response.body)
  end

  def endpoints_path
    '/v1/endpoints'
  end

  def sample_post_params
    {
      "data": {
        "type": "endpoints",
        "attributes": {
          "verb": "GET",
          "path": "/greeting",
          "response": {
            "code": 200,
            "headers": {"Content-Type": "application/json"},
            "body": "\"{ \"message\": \"Hello, world\" }\""
          }
        }
      }
    }.to_json
  end

  def json_api_headers
    { "Accept": "application/vnd.api+json", "Content-Type": "application/vnd.api+json" }
  end

  def json_api_accept_header
    { "Accept": "application/vnd.api+json" }
  end
end