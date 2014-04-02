class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answerer
      t.text :body
      t.references :container, :polymorphic => true

      t.timestamps
    end
  end
end
