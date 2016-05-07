class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
    	t.string :key
    	t.string :url

      t.timestamps null: false
    end
    add_index :users , "key"
  end

  def down
  	drop_table :users
  end

end
