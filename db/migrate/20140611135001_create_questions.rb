class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :question_type
      t.references :poll

      t.timestamps
    end
  end
end
