class QuestionVote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	validates :user_id, uniqueness: {scope: :question_id, message: "can only vote once"}, presence: true
	# Only one user can vote once

end

