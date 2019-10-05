# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_05_164234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fields", force: :cascade do |t|
    t.string "name", null: false
    t.integer "accessibility", null: false
    t.text "validations"
    t.text "options"
    t.string "type", null: false
    t.bigint "form_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "label", default: ""
    t.string "hint", default: ""
    t.integer "position"
    t.index ["form_id"], name: "index_fields_on_form_id"
    t.index ["type"], name: "index_fields_on_type"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.index ["attachable_type", "attachable_id"], name: "index_forms_on_attachable_type_and_attachable_id"
    t.index ["name"], name: "index_forms_on_name", unique: true
    t.index ["type"], name: "index_forms_on_type"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  create_table "wf_arcs", comment: "The arcs of the workflow petri net.\nArcs always go between a transition and a place.\nThe direction is relative to the transition here, i.e.\nin means it goes into the transition, out means it goes\naway from the transition.\n", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "transition_id"
    t.bigint "place_id"
    t.integer "direction", default: 0, comment: "0-in, 1-out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_case_assignments", comment: "Manual per-case assignments of roles to parties.", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "role_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_cases", comment: "The instance of a process, e.g. the case of publishing one article, \nthe case of handling one insurance claim, the case of handling\none ecommerce order, of fixing one ticket-tracker ticket.\n", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "context_id"
    t.bigint "obj_id", comment: "A case is generally about some other object, e.g., an insurance claim, an article,\na ticket, an order, etc. This is the place to store the reference to that object.\nIt is not uncommong to have more than one case for the same object, e.g., we might \nhave one process for evaluating and honoring an insurance claim, and another for archiving\nlegal information about a claim.\n"
    t.string "obj_type"
    t.integer "state", default: 0, comment: "0-created, 1-active, 2-suspended, 3-canceled, 4-finished"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_context_assignments", comment: "Static (default) per-context assignments of roles to parties. ", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "context_id"
    t.bigint "role_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_contexts", comment: "The context of a workflow holds everything that''s not directly \npart of the Petri Net structure, the stuff that''s likely to\nbe changed as the workflow is applied in a real business, and that\nyou will want to customize across different departments of the \nsame business. It includes assignments of transitions to parties,\nthe call-backs, etc.\n", force: :cascade do |t|
    t.string "context_key"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_places", comment: "The circles of the petri net. These hold the tokens representing the overall\n  state of the workflow.", force: :cascade do |t|
    t.bigint "workflow_id"
    t.string "name"
    t.integer "sort_order", default: 0
    t.integer "kind", default: 0, comment: "类型：0-normal，1-start，2-end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_roles", comment: "A process has certain roles associated with it, such as \"submitter\", \n\"reviewer\", \"editor\", \"claimant\", etc. For each transition, then, you\nspecify what role is to perform that task. Thus, two or more tasks can be\nperformed by one and the same role, so that when the role is reassigned,\nit reflects assignments of both tasks. Users and parties are then assigned\nto roles instead of directly to tasks.\n", force: :cascade do |t|
    t.bigint "workflow_id"
    t.string "name"
    t.integer "sort_order", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_task_assignments", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_tasks", comment: "The tasks that need to be done, who can do it, and what state it''s in.\nA task is the instance of a transition.\n", force: :cascade do |t|
    t.bigint "case_id"
    t.bigint "workflow_id"
    t.bigint "transition_id"
    t.integer "state", default: 0, comment: "0-enabled, 1-started, 2-canceled, 3-finished,4-overridden"
    t.datetime "enabled_at", default: -> { "timezone('utc'::text, now())" }
    t.datetime "started_at"
    t.datetime "canceled_at"
    t.datetime "finished_at"
    t.datetime "overridden_at"
    t.datetime "trigger_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_tokens", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "case_id"
    t.bigint "task_id"
    t.bigint "place_id"
    t.integer "state", default: 0, comment: "0-free, 1-locked, 2-canceled, 3-consumed"
    t.bigint "locked_task_id"
    t.datetime "produced_at", default: -> { "timezone('utc'::text, now())" }
    t.datetime "locked_at"
    t.datetime "canceled_at"
    t.datetime "consumed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_transition_role_assigns", comment: "When part of the output of one task is to assign users to a role,\nspecify that this is the case by inserting a row here.\n", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "transition_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wf_transitions", comment: "The squares in the petri net. The things that somebody (or something) actually does.", force: :cascade do |t|
    t.string "name"
    t.bigint "workflow_id"
    t.integer "sort_order", default: 0
    t.integer "trigger_type", default: 0, comment: "0-user,1-automatic, 2-message,3-time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "formable_type", comment: "The workflow attributes that should be set when the given transition is fired."
    t.bigint "formable_id"
    t.bigint "role_id", comment: "what role does this transition belong to (only for user-triggered transitions)"
  end

  create_table "wf_workflows", comment: "Parent table for the workflow definition", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workflow_instances", force: :cascade do |t|
    t.text "payload"
    t.integer "status", default: 0, null: false
    t.bigint "workflow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.string "creator_type"
    t.bigint "creator_id"
    t.index ["creator_type", "creator_id"], name: "index_workflow_instances_on_creator_type_and_creator_id"
    t.index ["workflow_id"], name: "index_workflow_instances_on_workflow_id"
  end

  create_table "workflow_places", force: :cascade do |t|
    t.bigint "input_transition_id"
    t.bigint "output_transition_id"
    t.string "type", null: false
    t.bigint "workflow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "uid"
    t.index ["input_transition_id"], name: "index_workflow_places_on_input_transition_id"
    t.index ["output_transition_id"], name: "index_workflow_places_on_output_transition_id"
    t.index ["workflow_id"], name: "index_workflow_places_on_workflow_id"
  end

  create_table "workflow_tokens", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "place_id"
    t.bigint "previous_id"
    t.bigint "instance_id"
    t.bigint "workflow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.text "payload"
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.string "forwardable_type"
    t.bigint "forwardable_id"
    t.index ["assignable_type", "assignable_id"], name: "index_workflow_tokens_on_assignable_type_and_assignable_id"
    t.index ["forwardable_type", "forwardable_id"], name: "index_workflow_tokens_on_forwardable_type_and_forwardable_id"
    t.index ["instance_id"], name: "index_workflow_tokens_on_instance_id"
    t.index ["place_id"], name: "index_workflow_tokens_on_place_id"
    t.index ["previous_id"], name: "index_workflow_tokens_on_previous_id"
    t.index ["workflow_id"], name: "index_workflow_tokens_on_workflow_id"
  end

  create_table "workflow_transitions", force: :cascade do |t|
    t.string "type", null: false
    t.bigint "workflow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "uid"
    t.text "options"
    t.index ["workflow_id"], name: "index_workflow_transitions_on_workflow_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "form_id"
    t.string "name", default: ""
    t.text "description", default: ""
    t.bigint "start_place_id"
    t.index ["form_id"], name: "index_workflows_on_form_id"
    t.index ["start_place_id"], name: "index_workflows_on_start_place_id"
  end

  add_foreign_key "fields", "forms"
  add_foreign_key "users", "groups"
  add_foreign_key "workflow_instances", "workflows"
  add_foreign_key "workflow_places", "workflow_transitions", column: "input_transition_id"
  add_foreign_key "workflow_places", "workflow_transitions", column: "output_transition_id"
  add_foreign_key "workflow_places", "workflows"
  add_foreign_key "workflow_tokens", "workflow_instances", column: "instance_id"
  add_foreign_key "workflow_tokens", "workflow_places", column: "place_id"
  add_foreign_key "workflow_tokens", "workflow_tokens", column: "previous_id"
  add_foreign_key "workflow_tokens", "workflows"
  add_foreign_key "workflow_transitions", "workflows"
  add_foreign_key "workflows", "forms"
  add_foreign_key "workflows", "workflow_places", column: "start_place_id"
end
