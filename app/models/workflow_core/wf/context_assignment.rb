module WorkflowCore
  class Wf::ContextAssignment < ApplicationRecord
    belongs_to :workflow
    belongs_to :role
    belongs_to :context
  end
end
