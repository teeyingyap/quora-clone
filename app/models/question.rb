class Question < ActiveRecord::Base
    belongs_to :user
    has_many :answers
    has_many :question_votes

    validates :title, presence: true
	validates :title, uniqueness: true
	validates :title, format: { with: /\A(.*[^.?!]*)\?\z/, message: "should end with a question mark."}

end

