class Comment < ApplicationRecord
	belongs_to :instrument
	belongs_to :user
	validates :name, :comment, presence: true, length: { minimum: 2 }
end
