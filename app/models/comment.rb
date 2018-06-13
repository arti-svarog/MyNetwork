class Comment
  include Mongoid::Document
  field :user_id, type: Integer
  field :post_id, type: Integer
  field :comment, type: String
  belongs_to :user
  belongs_to :post
end
