class Goal < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_many :comments, as: :commentable
end
