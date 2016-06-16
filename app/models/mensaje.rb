class Mensaje < ActiveRecord::Base
	attr_accessible :user_id, :idea_id, :mensaje,:visto_duenio, :visto_destinatario
end
