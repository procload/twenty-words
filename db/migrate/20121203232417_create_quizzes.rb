class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :score
      t.string :difficulty

      t.timestamps
    end
  end
end
