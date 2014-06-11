class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :question
      t.references :answer
      t.string :response

      t.timestamps
    end
  end
end
