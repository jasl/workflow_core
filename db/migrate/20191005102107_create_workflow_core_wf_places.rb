class CreateWorkflowCoreWfPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :wf_places, comment: 'The circles of the petri net. These hold the tokens representing the overall
  state of the workflow.' do |t|
      t.bigint :workflow_id
      t.string :name
      t.integer :sort_order, default: 0
      t.integer :kind, default: 0, comment: '类型：0-normal，1-start，2-end'
      t.timestamps
    end
  end
end
