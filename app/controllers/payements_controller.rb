class PayementsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show        
    @cart = User.first
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:cart])
  end


  # def payu_callback
  # end

  def update
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

  def payu_return
    notification = PayuIndia::Notification.new(request.query_string, options = {:key => '4JBWmWpK', :salt => 'Yok72qeGpc', :params => params})
    @user = User.find(notification.invoice) # notification.invoice is order id/cart id which you have submited from payment direction page.
    # @user = User.last
    if notification.acknowledge      
      begin
        if notification.complete?          
          @user.payment_status = 'success'
          @user.payment_at = Time.now
          @transaction = TransactionHistory.create(:total => notification.gross, :card_holder_name => params['name_on_card'], :user_id => notification.invoice)
          redirect_to post_index_url
        else          
          @user.status = "failed"
          render :text => "Transaction Failed! #{notification.message}"
        end
      ensure
        @user.save
      end
    end    
  end
end
