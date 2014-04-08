class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_string
      t.string :password_digest

      t.timestamps
    end
  end
end
