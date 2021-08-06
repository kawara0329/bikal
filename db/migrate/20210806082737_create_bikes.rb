class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :name            ,null: false
      t.integer :size           ,null: false
      t.integer :category_id    ,null: false
      t.references :user        ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
