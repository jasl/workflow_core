module WorkflowCore
  class Wf::Transition < ApplicationRecord
    self.table_name = 'wf_transitions'
    belongs_to :workflow
    has_many :arcs
    belongs_to :formable, optional: true
  end
end
