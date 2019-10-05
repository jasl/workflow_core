module WorkflowCore
  class Wf::TaskAssignment < ApplicationRecord
    belongs_to :task
    belongs_to :user
  end
end
