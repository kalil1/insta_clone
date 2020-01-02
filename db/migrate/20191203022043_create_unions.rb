class CreateUnions < ActiveRecord::Migration[5.2]
  def change
    create_table :unions do |t|
      t.integer :user1
      t.integer :user2
      t.integer :postid, :default => nil
      t.string :union_type, :default => "like"

      t.timestamps
    end
  end
end
