helpers do
  
  def count_question_upvotes(question)
    # count upvotes in question
    question.question_votes.where(updown: true).count
  end

  def count_answer_upvotes(answer)
    # count upvotes in answer
    answer.answer_votes.where(updown: true).count
  end

  def count_question_downvotes(question)
    # count downvotes in question
    question.question_votes.where(updown: false).count
  end

  def count_answer_downvotes(answer)
    # count upvotes in answer
    answer.answer_votes.where(updown: false).count
  end
end

