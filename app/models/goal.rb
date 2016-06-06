class Goal < ActiveRecord::Base
  validates :name, :public, :completed, presence: true

  belongs_to :user
end
