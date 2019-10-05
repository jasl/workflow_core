class CreateWorkflowCoreWfCases < ActiveRecord::Migration[6.0]
  def change
    comment = <<~DOC
      The instance of a process, e.g. the case of publishing one article, 
      the case of handling one insurance claim, the case of handling
      one ecommerce order, of fixing one ticket-tracker ticket.
    DOC

    obj_comment = <<~DOC
      A case is generally about some other object, e.g., an insurance claim, an article,
      a ticket, an order, etc. This is the place to store the reference to that object.
      It is not uncommong to have more than one case for the same object, e.g., we might 
      have one process for evaluating and honoring an insurance claim, and another for archiving
      legal information about a claim.
    DOC
    create_table :wf_cases, comment: comment do |t|
      t.bigint :workflow_id
      t.bigint :context_id
      t.bigint :obj_id, comment: obj_comment
      t.string :obj_type
      t.integer :state, default: 0, comment: '0-created, 1-active, 2-suspended, 3-canceled, 4-finished'
      t.timestamps
    end
  end
end
