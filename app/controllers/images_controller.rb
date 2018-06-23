class ImagesController < ApplicationController
  def index
  	# binding.pry
  	@images = current_user.images
  	@image = Image.last
  	respond_to do |format|
      format.html{}
      format.js{@image}
    end
  end

	def preview
		render json: {image: Image.find(params[:image_id])}
	end

	def show
		@image = Image.last
	end

end
