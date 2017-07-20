require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :confirmations
  has_many :approvals, as: :approvable

  # belongs_to :primary_team, class_name: "Team"
  # belongs_to :secondary_team, class_name: "Team"

  validate :different_team

  def primary_team
    Team.find(self.primary_team_id) unless self.primary_team_id == nil
  end

  def secondary_team
    Team.find(self.secondary_team_id) unless self.secondary_team_id == nil
  end


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def different_team
    if self.primary_team_id == nil || self.secondary_team_id == nil
      return true
    end

    if self.primary_team_id == self.secondary_team_id
      errors.add :secondary_team_id, "must be different from primary team"
    end
  end



end
