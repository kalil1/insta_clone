class AddIndexesToUnions < ActiveRecord::Migration[7.1] 
  def change
    add_index :unions, [:postid, :user1, :union_type]
    add_index :unions, [:user1, :union_type]
    add_index :unions, [:postid, :union_type]
  end
end
