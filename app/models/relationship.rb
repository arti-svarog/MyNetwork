class Relationship
  include Mongoid::Document

  belongs_to :user
  # belongs_to :followed, class_name: "User"
  # validates :follower_id, uniqueness: {scope: :followed_id}, presence: true
  # validates :followed_id, presence: true
  

  field :user_id, type: String
  field :reciever_id, type: String
  field :status, type: String
end
