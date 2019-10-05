module WorkflowCore
  class Wf::Task < ApplicationRecord
    belongs_to :workflow
    belongs_to :case
    belongs_to :transition
    belongs_to :user
    has_many :task_assignments
  end
end
