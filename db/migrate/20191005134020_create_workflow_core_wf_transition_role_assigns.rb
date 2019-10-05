class CreateWorkflowCoreWfTransitionRoleAssigns < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      When part of the output of one task is to assign users to a role,
      specify that this is the case by inserting a row here.
    DOC
    create_table :wf_transition_role_assigns, comment: comment do |t|
      t.bigint :workflow_id
      t.bigint :transition_id
      t.bigint :role_id
      t.timestamps
    end
  end
end
