class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Clearance::Controller
end
