post '/answervotes/:id/up' do
	answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id) 
	@answer = Answer.find(params[:id])
	@question_id = @answer.question.id  
	  if !answervote.present?
		answervote = AnswerVote.create(answer_id:params[:id], user_id:current_user.id, updown:params[:answervote][:updown])
	  
	  elsif answervote.updown == true
	  	answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id).delete
	  
	  elsif answervote.updown == false
	    answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id) 	
	    answervote = answervote.update(updown:"true")	
	  end
        return {answervote: answervote, vote_count: count_answer_upvotes(Answer.find(params[:id]))}.to_json
	  #redirect "/questions/#{@question_id}"
end

post '/answervotes/:id/down' do
	answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id)
	@answer = Answer.find(params[:id])
	@question_id = @answer.question.id  
	  if !answervote.present?
		answervote = AnswerVote.create(answer_id:params[:id], user_id:current_user.id, updown:params[:answervote][:updown])
	  
	  elsif answervote.updown == false
	  	answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id).delete
	  
	  elsif answervote.updown == true
	    answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id) 	
	    answervote = answervote.update(updown:"false")
	  end
        return {answervote: answervote, vote_count: count_answer_downvotes(Answer.find(params[:id]))}.to_json
    #redirect "/questions/#{@question_id}"  
end


