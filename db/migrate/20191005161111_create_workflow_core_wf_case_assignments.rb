class CreateWorkflowCoreWfCaseAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :wf_case_assignments, comment: "Manual per-case assignments of roles to parties." do |t|
      t.bigint :workflow_id
      t.bigint :role_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
