class DropSetups < ActiveRecord::Migration[5.0]
  def change
    drop_table :setups do |t|
      t.string :title
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
