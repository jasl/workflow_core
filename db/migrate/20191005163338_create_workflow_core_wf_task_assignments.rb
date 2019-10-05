class CreateWorkflowCoreWfTaskAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :wf_task_assignments do |t|
      t.bigint :task_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
