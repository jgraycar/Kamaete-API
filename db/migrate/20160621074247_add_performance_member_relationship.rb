class AddPerformanceMemberRelationship < ActiveRecord::Migration[5.0]
  def change
    create_table :members_performances, id: false do |t|
      t.belongs_to :performance, index: true
      t.belongs_to :member, index: true
    end
  end
end
