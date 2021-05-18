class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :password, :high_score, :rank
end
