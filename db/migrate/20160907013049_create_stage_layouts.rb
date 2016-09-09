class CreateStageLayouts < ActiveRecord::Migration[5.0]
  def change
    create_table :stage_layouts do |t|
      t.string :name
      t.belongs_to :performance, index: true

      t.timestamps
    end
  end
end
