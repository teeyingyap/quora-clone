class CreateVotes < ActiveRecord::Migration
	def change
	  create_table :question_votes do |t|
		t.references :question, foreign_key: true     
	    t.references :user, foreign_key: true
	    t.boolean :updown

	    t.timestamps null: false
	  end

	  create_table :answer_votes do |t|
		t.references :answer, foreign_key: true       
	    t.references :user, foreign_key: true
	    t.boolean :updown

	    t.timestamps null: false
	  end
	end
end
