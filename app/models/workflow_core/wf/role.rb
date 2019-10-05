module WorkflowCore
  class Wf::Role < ApplicationRecord
    belongs_to :workflow
    has_many :transition_role_assigns
  end
end
