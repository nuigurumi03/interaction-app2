class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer  :user_id,              foreign_key: true
      t.integer  :post_id, null: false, foreign_key: true
      t.text     :message

      t.timestamps
    end
  end
end
