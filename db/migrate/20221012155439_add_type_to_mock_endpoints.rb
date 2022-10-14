class AddTypeToMockEndpoints < ActiveRecord::Migration[7.0]
  def change
    add_column :mock_endpoints, :type, :string
  end
end
