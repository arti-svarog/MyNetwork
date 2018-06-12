class Interest
  include Mongoid::Document
  field :hobby, type: String, default: ''
  belongs_to :user
end
