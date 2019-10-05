module WorkflowCore
  class Wf::TransitionRoleAssign < ApplicationRecord
    belongs_to :workflow
    belongs_to :transition
    belongs_to :role
  end
end
