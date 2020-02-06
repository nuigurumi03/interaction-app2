class CreateIcons < ActiveRecord::Migration[5.1]
  def change
    create_table :icons do |t|
      t.integer :user_id,            foreign_key: true
      t.string  :image

      t.timestamps
    end
  end
end
