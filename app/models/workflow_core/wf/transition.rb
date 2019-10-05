module WorkflowCore
  class Wf::Transition < ApplicationRecord
    self.table_name = 'wf_transitions'
    belongs_to :workflow
    has_many :arcs
    has_many :transition_role_assigns
    has_many :tasks
    has_many :roles, though: :transition_role_assigns
    belongs_to :formable, optional: true
    belongs_to :role, optional: true
  end
end
