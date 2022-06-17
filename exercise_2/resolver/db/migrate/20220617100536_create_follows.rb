class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.string :follow_resource_type 
      t.references :follower, foreign_key: { to_table: :users }
      t.string :follow_resource_id

      t.timestamps
    end
  end
end
