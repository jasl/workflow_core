class CreateWorkflowCoreWfWorkflows < ActiveRecord::Migration[6.0]
  def change
    create_table :wf_workflows, comment: 'Parent table for the workflow definition' do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
