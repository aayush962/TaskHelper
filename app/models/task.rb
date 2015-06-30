class Task < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :notes, presence: true
	validates :priority, presence: true
end
