class CreateWorkflowCoreWfTasks < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      The tasks that need to be done, who can do it, and what state it''s in.
      A task is the instance of a transition.
    DOC
    create_table :wf_tasks, comment: comment do |t|
      t.bigint :case_id
      t.bigint :workflow_id
      t.bigint :transition_id
      t.integer :state, default: 0, comment: "0-enabled, 1-started, 2-canceled, 3-finished,4-overridden"
      t.datetime :enabled_at, default: -> { "timezone('utc'::text, now())" }
      t.datetime :started_at
      t.datetime :canceled_at
      t.datetime :finished_at
      t.datetime :overridden_at
      t.datetime :trigger_at
      t.timestamps
    end
  end
end
