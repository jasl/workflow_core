module WorkflowCore
  class Wf::Token < ApplicationRecord
    belongs_to :workflow
    belongs_to :task
    belongs_to :case
    belongs_to :place
    belongs_to :locked_task, class_name: 'Task'
  end
end
