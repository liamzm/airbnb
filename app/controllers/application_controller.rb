class ApplicationController < ActionController::Base
	include Clearance::Controller
  # def after_sign_in_path_for(resource)
  # 	listings_path
  # end
module BackgroundJobsWithSidekiq
	class Application < Rails::Application


		config.active_job.queue_adapter = :sideqkiq
	end
end
end