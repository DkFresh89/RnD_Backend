class QuestionSerializer
  include JSONAPI::Serializer
  attributes :category, :type, :difficulty, :question, :correct_answer, :incorrect_answer, :points
end
