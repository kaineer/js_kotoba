class CreateTangos < ActiveRecord::Migration
  def up
    create_table :tangos do |t|
      t.string :kanji
      t.string :kana
      t.string :meaning
      t.integer :jlpt
    end
  end

  def down
    drop_table :tangos
  end
end
