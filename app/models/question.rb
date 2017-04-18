class Question < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true
	validates :title, uniqueness: true
	validates :title, format: { with: /\A(.*[^.?!]*)\?\z/, message: "should end with a question mark."}

end

