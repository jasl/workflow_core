class CreateWorkflowCoreWfContextAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :wf_context_assignments, comment: "Static (default) per-context assignments of roles to parties. " do |t|
      t.bigint :workflow_id
      t.bigint :context_id
      t.bigint :role_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
