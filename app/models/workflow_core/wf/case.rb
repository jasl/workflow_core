module WorkflowCore
  class Wf::Case < ApplicationRecord
    belongs_to :workflow
    belongs_to :context
    belongs_to :obj, optional: true

    enum state: {
      created: 0,
      active: 1,
      suspended: 2,
      canceled: 3,
      finished: 4
    }
  end
end
