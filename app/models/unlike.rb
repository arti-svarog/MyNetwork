class Unlike
  include Mongoid::Document
  field :user_id, type: String
  field :post_id, type: String
  belongs_to :post
end
