class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :title
			t.references :question, foreign_key: true
			t.references :user, foreign_key: true
			t.timestamps
		end 
	end
end


