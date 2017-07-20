class CreateApprovals < ActiveRecord::Migration[5.0]
  def change
    create_table :approvals do |t|
      t.string :status
      t.integer :approver_id
      t.integer :approvable_id
      t.string :approvable_type

      t.timestamps
    end
  end
end
