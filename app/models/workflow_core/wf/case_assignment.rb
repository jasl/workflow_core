module WorkflowCore
  class Wf::CaseAssignment < ApplicationRecord
    belongs_to :workflow
    belongs_to :case
    belongs_to :role
    belongs_to :user, optional: true
  end
end
