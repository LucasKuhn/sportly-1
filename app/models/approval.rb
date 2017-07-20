class Approval < ApplicationRecord
  belongs_to :league_manager, class_name: "User", foreign_key: :approver_id
  belongs_to :team_captain, class_name: "User", foreign_key: :approver_id
  belongs_to :approvable, polymorphic: true
end
