class CreateWorkflowCoreWfRoles < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      A process has certain roles associated with it, such as "submitter", 
      "reviewer", "editor", "claimant", etc. For each transition, then, you
      specify what role is to perform that task. Thus, two or more tasks can be
      performed by one and the same role, so that when the role is reassigned,
      it reflects assignments of both tasks. Users and parties are then assigned
      to roles instead of directly to tasks.
    DOC
    create_table :wf_roles, comment: comment do |t|
      t.bigint :workflow_id
      t.string :name
      t.integer :sort_order, default: 0
      t.timestamps
    end

    add_column :wf_transitions, :role_id, :bigint, comment: "what role does this transition belong to (only for user-triggered transitions)"
  end
end
