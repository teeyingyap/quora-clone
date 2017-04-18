class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title
			t.references :user, foreign_key: true
			t.timestamps
		end 
	end
end


