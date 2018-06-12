class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    super do |resource|
      resource.firstname = params[:user][:firstname] if params[:user][:firstname].present?
      resource.lastname = params[:user][:lastname]  if params[:user][:lastname].present?
      resource.gender = params[:user][:gender]  if params[:user][:gender].present?
      resource.city = params[:user][:city] if params[:user][:city].present?
      resource.dob = params[:user][:day] + "-" + params[:user][:month] + "-" + params[:user][:year] rescue Date.today
      resource.payment_status = "pending"
      resource.mobile_number = params[:user][:mobile_number]
      resource.save
    end
  end
end
