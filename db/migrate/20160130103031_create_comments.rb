class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :user_name
      t.text :comment
      t.timestamps null: false
    end
  end
end
