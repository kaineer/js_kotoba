class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.string     :name
      t.integer    :parent_id
      t.string     :ancestry

      t.boolean    :public
      t.integer    :user_id

      t.timestamps
    end

    add_index :tags, :ancestry
    add_index :tags, [:user_id, :public]
  end

  def down
    drop_table :tags
  end
end
