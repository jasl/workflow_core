module WorkflowCore
  class Wf::Arc < ApplicationRecord
    self.table_name = 'wf_arcs'
    belongs_to :workflow
    belongs_to :transition
    belongs_to :place

    enum direction: {
      in: 0,
      out: 1
    }
  end
end
