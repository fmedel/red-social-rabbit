class Apelar < ActiveRecord::Base
	belongs_to :estado
	belongs_to :denuncia
end
