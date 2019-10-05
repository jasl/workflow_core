module WorkflowCore
  class Wf::Workflow < ApplicationRecord
    self.table_name = 'wf_workflows'
    has_many :places
    has_many :transitions
    has_many :arcs
    has_many :roles
    has_many :transition_role_assigns
    has_many :context_assignments
    has_many :cases
  end
end
