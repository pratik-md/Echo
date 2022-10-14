module Echo::V1
  class MockEndpoints < Grape::API
    version 'v1', using: :path

    MockEndpoint.all.each do |mock_endpoint|
      response = Proc.new { mock_endpoint.formatted_response_body }

      case mock_endpoint.verb
      when 'GET'
        get mock_endpoint.path do 
          content_type mock_endpoint.response.dig('headers', 'Content-Type')
          response.call
        end
      when 'POST'
        post mock_endpoint.path do 
          content_type mock_endpoint.response.dig('headers', 'Content-Type')
          response.call
        end
      when 'PATCH'
        patch mock_endpoint.path do 
          content_type mock_endpoint.response.dig('headers', 'Content-Type')
          response.call
        end
      when 'DELETE'
        delete mock_endpoint.path do 
          content_type mock_endpoint.response.dig('headers', 'Content-Type')
          response.call
        end
      end
    end
  end
end