class Postular < ActiveRecord::Base
	attr_accessible  :user_id ,:idea_id, :oferta
	belongs_to :user# modelo a que pertenece
end
