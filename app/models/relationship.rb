class Relationship
  include Mongoid::Document

  # belongs_to :user
  # belongs_to :followed, class_name: "User"
  # validates :follower_id, uniqueness: {scope: :followed_id}, presence: true
  # validates :followed_id, presence: true
  belongs_to :sender, :class_name => "User", :foreign_key => "user_id", :counter_cache => true
  belongs_to :reciever, :class_name => "User", :foreign_key => "reciever_id"

  field :user_id, type: String
  field :reciever_id, type: String
  field :status, type: String

  def self.requests user
    where(reciever_id: user.id,status: 'pending')
  end

  def self.friend_list user
    Relationship.any_of({:user_id => user.id},{:reciever_id => user.id}).and(status: "accepted")
  end

end
