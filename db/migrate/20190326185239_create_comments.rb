class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.integer :instrument_id
      t.references :user, foreign_key: true
    end
  end
end
