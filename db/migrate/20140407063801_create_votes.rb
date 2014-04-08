class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :answer_id
      t.string :username
      t.integer :vote_value

      t.timestamps
    end
  end
end
