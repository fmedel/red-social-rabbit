class Grado < ActiveRecord::Base
	attr_accessible  :descripcion
	has_many :user

end
