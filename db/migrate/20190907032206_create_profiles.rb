class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :website
      t.text :bio
      t.string :phone
      t.string :profile_pic
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
