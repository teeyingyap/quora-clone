post '/question' do
  question = Question.new(params[:question])
  question.user_id = current_user.id
  if question.save
    redirect "users/#{current_user.id}/my_question"
  else
  	@error = question.errors.full_messages.first #the error is from the validation whenever you try to save something in
  	erb :"users/my_question" #so u cannot use the this same error method in /login because you're not trying to save anything to the database
  end
end 

get '/questions/:id' do 
	# byebug
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"questions/question"
end

post '/question/:id/answer' do
  answer = Answer.new(params[:answer])
  answer.question_id = params[:id]
  answer.user_id = current_user.id 
  if answer.save
    redirect "/questions/#{params[:id]}"
  else
    @error = answer.errors.full_messages.first #the error is from the validation whenever you try to save something in
  	erb :"questions/question" #so u cannot use the this same error method in /login because you're not trying to save anything to the database
  end
end
