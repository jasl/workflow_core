module WorkflowCore
  class Wf::Context < ApplicationRecord
    has_many :context_assignments
  end
end
