class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nonscreen_last_name
      t.string :nonscreen_first_name
      t.string :name
      t.string :email
      t.text :self_info
      t.string :gender_identities
      t.date :birthday
      t.string :address

      t.timestamps
    end
  end
end
