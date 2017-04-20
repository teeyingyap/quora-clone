class AnswerVote < ActiveRecord::Base
	belongs_to :answer
	belongs_to :user
	validates :user_id, uniqueness: {scope: :answer_id, message: "can only vote once"}, presence: true
	# Only one user can vote once
	
end