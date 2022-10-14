class CreateMockEndpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :mock_endpoints do |t|
      t.string :verb
      t.string :path
      t.json :response, default: {}, null: false

      t.timestamps
    end
  end
end
