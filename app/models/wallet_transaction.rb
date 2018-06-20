class WalletTransaction
  include Mongoid::Document
  field :status, type: String, default: 'pending'
  field :state, type: String, default: 'withdrawal'
  field :amount, type: Float, default: 0.0
  belongs_to :user


  #Genrate request for withdrawal amount
  def self.genrate_transaction user,amount
  	#Deduct amount from user wallet
  	user.amount = user.amount - amount
	user.save
	#Genrate request to admin for withdrawal amount from user wallet
	transactions = user.wallet_transactions.new(amount: amount,status: "pending",state: "withdrawal")
	transactions.save
  end

end
