module WorkflowCore
  class Wf::Place < ApplicationRecord
    self.table_name = 'wf_places'
    belongs_to :workflow
    has_many :arcs
    has_many :tokens
    enum kind: {
      normal: 0,
      start: 1,
      end: 2
    }
  end
end
