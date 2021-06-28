class CreateTableAddress < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.bigint :user_id
      t.text :address
      t.timestamps
    end
  end
end
