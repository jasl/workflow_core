class CreateWorkflowCoreWfArcs < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      The arcs of the workflow petri net.
      Arcs always go between a transition and a place.
      The direction is relative to the transition here, i.e.
      in means it goes into the transition, out means it goes
      away from the transition.
    DOC
    create_table :wf_arcs, comment: comment do |t|
      t.bigint :workflow_id
      t.bigint :transition_id
      t.bigint :place_id
      t.integer :direction, default: 0, comment: '0-in, 1-out'
      t.timestamps
      # TODO guard callback
    end
  end
end
