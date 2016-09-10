class AddStageLayoutUserRelationship < ActiveRecord::Migration[5.0]
  def change
    change_table :stage_layouts do |t|
      t.belongs_to :user, index: true
    end
  end
end
