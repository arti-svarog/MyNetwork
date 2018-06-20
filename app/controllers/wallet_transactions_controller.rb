class WalletTransactionsController < ApplicationController

	#action for genrate  request for amount from user wallet
	def create
		if (current_user.amount > 1999)
			WalletTransaction.genrate_transaction(current_user,params[:wallet][:amount])
			flash[:success] = "Withdrawal Request genrate successfully..."
		else
			flash[:alert] = "Sorry! Your amount is less than 2000."
		end
		redirect_to '/'
	end

end
