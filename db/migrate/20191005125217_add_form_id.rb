class AddFormId < ActiveRecord::Migration[6.0]
  def change
    add_column :wf_transitions, :formable_type, :string, comment: "The workflow attributes that should be set when the given transition is fired."
    add_column :wf_transitions, :formable_id, :bigint
  end
end
