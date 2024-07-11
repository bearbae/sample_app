class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> chapter_7
      t.string :email

      t.timestamps
    end
<<<<<<< HEAD
=======
      t.string :email, unique: true

      t.timestamps
    end

    add_index :users, :email, unique: true
>>>>>>> chapter_6
=======
>>>>>>> chapter_7
  end
end
