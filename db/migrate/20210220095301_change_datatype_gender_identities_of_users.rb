class ChangeDatatypeGenderIdentitiesOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :gender_identities, :integer
  end
end
