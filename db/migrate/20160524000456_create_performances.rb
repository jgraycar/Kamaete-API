class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.string :title
      t.date :date
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
