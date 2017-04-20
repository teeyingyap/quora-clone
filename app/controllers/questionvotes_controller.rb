post '/questionvotes/:id/up' do

	questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 
	  if !questionvote.present?
		questionvote = QuestionVote.create(question_id:params[:id], user_id:current_user.id, updown:params[:questionvote][:updown])
	    
	  elsif questionvote.updown == true
	  	questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id).delete

	  elsif questionvote.updown == false
	    questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 	
	    questionvote = questionvote.update(updown:"true")
	  end
	  	return {questionvote: questionvote, vote_count: count_question_upvotes(Question.find(params[:id]))}.to_json
	  # redirect "/users/#{current_user.id}/my_question" 
end

post '/questionvotes/:id/down' do

	questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 
	  if !questionvote.present?
		questionvote = QuestionVote.create(question_id:params[:id], user_id:current_user.id, updown:params[:questionvote][:updown])
	  
	  elsif questionvote.updown == false 
	  	questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id).delete
	  
	  elsif questionvote.updown == true
	    questionvote = QuestionVote.find_by(question_id:params[:id], user_id:current_user.id) 	
	    questionvote = questionvote.update(updown:"false")	
	  end
	  return {questionvote: questionvote, vote_count: count_question_downvotes(Question.find(params[:id]))}.to_json
end

