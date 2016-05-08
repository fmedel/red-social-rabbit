class Usuario < ActiveRecord::Base
	 validates	:nombreEmpresa, presence: true , length: { minimum: 5 } , uniqueness: true
	 validates	:emailEmpresa, presence: true , length: { minimum: 10} 
	 validates	:rutEmpresa, presence: true , length: { minimum: 5} , uniqueness: true , numericality: true
	 validates	:nombresPersona, presence: true , length: { minimum: 3}
	 validates	:apellidosPersona, presence: true, length: { minimum: 3} 
	 validates	:rutPersona, presence: true , length: { minimum: 7 } , uniqueness: true , numericality: true
	 validates	:emailPersona, presence: true , length: { minimum: 10}
	 validates	:pasword, length: { minimum: 7} , confirmation: true
	 validates  :pasword_confirmation , length: { minimum: 7}, presence: true
	 validates  :termino_de_uso, acceptance: { accept: 'yes'}
end
