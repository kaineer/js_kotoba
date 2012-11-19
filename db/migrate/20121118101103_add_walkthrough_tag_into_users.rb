class AddWalkthroughTagIntoUsers < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      t.integer :walkthrough_tag
    end
  end

  def down
    change_table(:users) do |t|
      t.remove :walkthrough_tag
    end
  end
end
