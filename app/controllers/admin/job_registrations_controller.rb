   class Admin::JobRegistrationsController < ApplicationController

   # before_action :find_job
   #
   # def index
   #   @registrations = @job.registrations.includes(:wage_lower_bound).order("id DESC")
   # end
   #
   # def destroy
   #   @registration = @job.registrations.find_by_uuid(params[:id])
   #   @registration.destroy
   #
   #   redirect_to admin_job_registrations_path(@job)
   # end
   #
   # protected
   #
   # def find_job
   #   @job = Job.find_by_friendly_id!(params[:job_id])
   # end
   #
   # def registration_params
   #   params.require(:registration).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden, :requirement)
   # end

  end
