class Property < ApplicationRecord

	belongs_to :user

	paginates_per 10

	mount_uploaders :images, ImagesUploader

	has_many :bookings

end