module WorkflowCore
  class Wf::Transition < ApplicationRecord
    self.table_name = 'wf_transitions'
    belongs_to :workflow
  end
end
