class HomeController < ApplicationController
  def index
  	if current_user.present?
      redirect_to post_index_url
  	end
  end
end
