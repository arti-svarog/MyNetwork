class ReferralManagement
  include Mongoid::Document
  field :user_id, type: String
  field :referral_id, type: String
  field :amount, type: Float
end
