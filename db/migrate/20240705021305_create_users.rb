class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true

      t.timestamps
    end
<<<<<<< HEAD
=======

>>>>>>> f177aca (Chapter_7)
    add_index :users, :email, unique: true
  end
end
