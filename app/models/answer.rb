class Answer < ActiveRecord::Base
    belongs_to :user
    belongs_to :question
    has_many :answer_votes
    validates :title, presence: true
    validates :user_id, uniqueness: {scope: :question_id}, presence: true 
# one user can only answer once for a question
end