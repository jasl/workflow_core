class CreateWorkflowCoreWfTokens < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      Where the tokens currently are, and what task is laying hands on it, if any.
      A token is sort of the instance of a place, except there'll be one row here per
      token, and there can be more than one token per place.
    DOC
    create_table :wf_tokens do |t|
      t.bigint :workflow_id
      t.bigint :case_id
      t.bigint :task_id
      t.bigint :place_id
      t.integer :state, default: 0, comment: "0-free, 1-locked, 2-canceled, 3-consumed"
      t.bigint :locked_task_id
      t.datetime :produced_at, default: -> { "timezone('utc'::text, now())" }
      t.datetime :locked_at
      t.datetime :canceled_at
      t.datetime :consumed_at
      t.timestamps
    end
  end
end
