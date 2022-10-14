class MockEndpoint < ApplicationRecord

  validates :verb, inclusion: { in: ['GET', 'POST', 'PATCH', 'DELETE'], message: "cannot have value: %{value} as it is not a valid HTTP method name." }
  validates :path, format: { with: /\A(\/|(\/[a-zA-Z0-9\-]+)+)\z/, message: "syntax not accepted. Should contain a single slash, followed by alphanumeric chars and dashes, repeated 1 or multiple times." }
  validate :endpoint_uniqueness

  def endpoint_uniqueness
    duplicate_endpoint = MockEndpoint.where.not(id: id).where(verb: verb, path: path)
    errors.add :base, :duplicate, message: "An endpoint with the given 'verb' and 'path' already exists." if duplicate_endpoint.present?
  end

  def formatted_response_body
    json_representation = JSON.parse(response['body'].gsub(/(\"{)|(}\")/, "\"{" => "{", "}\"" => "}"))
  rescue JSON::ParserError => e
    response['body']
  end

  #frees column name 'type' by changing the column name for use with single table inheritance
  self.inheritance_column = :_type_disabled
  
end