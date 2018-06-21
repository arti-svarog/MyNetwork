class ProfileController < ApplicationController

	def edit
	end

	def payment
	end

	def show
		# binding.pry
		@user = User.find(params[:id])
		@request_status = Relationship.where(user_id: current_user.id , reciever_id: @user.id).first
		@following = Relationship.where(reciever_id: @user.id).count
		unless (@user.id == current_user.id)
			@create_post = false
			@posts = current_user.posts.order_by(:created_at.desc)
			# @posts = @user.posts.order_by(:created_at.desc)
		else
			@create_post = true
			@posts = current_user.posts.order_by(:created_at.desc)
		end
		# @sender_id = params[:id]
		# @request_status = @user.invited?(current_user)
	end

	def update
		# binding.pry
		@user = User.find(params[:id])
		case params[:user][:page]
		when "education_work"
			@user.university = params[:user][:university]
			@user.from = params[:user][:from]
			@user.to = params[:user][:to]
			@user.description = params[:user][:description]
			@user.graduate = params[:user][:graduate]
		when "work_experience"
			@user.education_description = params[:user][:education_description]
			@user.education_city = params[:user][:education_city]
			@user.education_to = params[:user][:education_to]
			@user.education_from = params[:user][:education_from]
			@user.designation = params[:user][:designation]
			@user.company = params[:user][:company]
		when "interests"
			@user.interests.create(hobby: params[:interest][:hobby])
		else
			params[:user][:dob] = params[:user][:day] + "-" + params[:user][:month] + "-" + params[:user][:year]
			@user.firstname = params[:user][:firstname]
			@user.lastname = params[:user][:lastname]
			@user.dob = params[:user][:dob]
			@user.gender = params[:user][:gender]
			@user.day = params[:user][:day]
			@user.month = params[:user][:month]
			@user.year = params[:user][:year]
			@user.about_us = params[:user][:about_us]
		end
		@user.save
		redirect_to root_url
	end
	
end
