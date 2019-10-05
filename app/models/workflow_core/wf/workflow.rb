module WorkflowCore
  class Wf::Workflow < ApplicationRecord
    self.table_name = 'wf_workflows'
    has_many :places
    has_many :transitions
  end
end
