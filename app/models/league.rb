class League < ApplicationRecord
  has_many :teams

  def self.one_id
    1
  end

  def self.one_manager
    User.find_by_id(999)
  end
end
