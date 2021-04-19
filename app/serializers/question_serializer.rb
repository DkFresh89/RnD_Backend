class QuestionSerializer
  include JSONAPI::Serializer
  attributes :category, :type, :difficulty, :question, :correct_answer, :incorrect_answers, :points, :num_of_questions

  serialize :incorrect_answers, Array
end
