class TransactionHistory
  include Mongoid::Document
  field :total, type: String
  field :card_holder_name, type: String
  field :user_id, type: String
end
