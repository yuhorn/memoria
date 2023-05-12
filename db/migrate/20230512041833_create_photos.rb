class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string     :memo,  null: false
      t.date       :date,  null: false
      t.references :user,  null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.timestamps
    end
  end
end
