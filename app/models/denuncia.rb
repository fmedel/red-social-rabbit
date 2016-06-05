class Denuncia < ActiveRecord::Base
	attr_accessible :user_id, :idea_id, :estado_id,:razon
	belongs_to :idea
	belongs_to :user
	belongs_to :estado
	has_many :apelar

end
