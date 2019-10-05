class CreateWorkflowCoreWfContexts < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      The context of a workflow holds everything that''s not directly 
      part of the Petri Net structure, the stuff that''s likely to
      be changed as the workflow is applied in a real business, and that
      you will want to customize across different departments of the 
      same business. It includes assignments of transitions to parties,
      the call-backs, etc.
    DOC
    create_table :wf_contexts, comment: comment do |t|
      t.string :context_key
      t.string :name
      t.timestamps
    end
    execute("insert into wf_contexts (context_key, name, created_at, updated_at) values ('default', 'Default Context', now(), now());")
  end
end
