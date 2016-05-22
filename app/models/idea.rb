class Idea < ActiveRecord::Base
	attr_accessible  :titulo ,:contenido,:visita,:estado, :user_id
	belongs_to :user# modelo a que pertenece 
end
 