class Estado < ActiveRecord::Base
	 has_many :ideas #tiene muchos 
	 has_many :denucia
	 has_many :apelar
end
