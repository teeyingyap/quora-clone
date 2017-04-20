post '/answervotes/:id/up' do
	answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id) 
	@answer = Answer.find(params[:id])
	@question_id = @answer.question.id  
	  if !answervote.present?
		answervote = AnswerVote.create(answer_id:params[:id], user_id:current_user.id, updown:params[:answervote][:updown])
	  elsif answervote.updown == true
	  	AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id).delete
	  elsif answervote.updown == false
	    answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id) 	
	    answervote = answervote.update(updown:"true")	
	  end
	  redirect "/questions/#{@question_id}"
end

post '/answervotes/:id/down' do
	answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id)
	@answer = Answer.find(params[:id])
	@question_id = @answer.question.id  
	  if !answervote.present?
		answervote = AnswerVote.create(answer_id:params[:id], user_id:current_user.id, updown:params[:answervote][:updown])
	  elsif answervote.updown == false
	  	AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id).delete
	  elsif answervote.updown == true
	    answervote = AnswerVote.find_by(answer_id:params[:id], user_id:current_user.id) 	
	    answervote = answervote.update(updown:"false")
	  end
    redirect "/questions/#{@question_id}"  
end


