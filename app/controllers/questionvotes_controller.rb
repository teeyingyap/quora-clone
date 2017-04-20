post '/questionvotes/:id/up' do

	questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 
	  if !questionvote.present?
		questionvote = QuestionVote.create(question_id:params[:id], user_id:current_user.id, updown:params[:questionvote][:updown])
	  elsif questionvote.updown == true
	  	QuestionVote.find_by(question_id:params[:id], user_id:current_user.id).delete
	  elsif questionvote.updown == false
	    questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 	
	    questionvote = questionvote.update(updown:"true")
	  end
	  redirect "/users/#{current_user.id}/my_question" 
end

post '/questionvotes/:id/down' do

	questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 
	  if !questionvote.present?
		questionvote = QuestionVote.create(question_id:params[:id], user_id:current_user.id, updown:params[:questionvote][:updown])
	  elsif questionvote.updown == false 
	  	QuestionVote.find_by(question_id:params[:id], user_id:current_user.id).delete
	  elsif questionvote.updown == true
	    questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 	
	    questionvote = questionvote.update(updown:"false")	
	  end
	  redirect "/users/#{current_user.id}/my_question" 
end

