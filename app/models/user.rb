class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible 	:nombreEmpresa, :rutEmpresa, :emailPersona, :apellidosPersona, :nombresPersona, 
       					:rutPersona, :grado_id , :email, :password, :password_confirmation

  has_many :ideas #tiene muchos 
   validates  :nombreEmpresa, presence: true , length: { minimum: 3 } , uniqueness: true
   validates  :email, presence: true , length: { minimum: 3} 
   validates  :rutEmpresa, presence: true , length: { minimum:3} , uniqueness: true , numericality: true
   validates  :nombresPersona, presence: true , length: { minimum: 3}
   validates  :apellidosPersona, presence: true, length: { minimum: 3}
   validates  :rutPersona, presence: true , length: { minimum: 3 } , uniqueness: true , numericality: true
   validates  :emailPersona, presence: true , length: { minimum: 3}
   validates  :password, length: { minimum: 8} , confirmation: true
   validates  :password_confirmation , length: { minimum: 8}, presence: true
   validates  :grado_id, presence: true, numericality: true 

   #validates  :termino_de_uso, acceptance: { accept: 'yes'}
     def  nombre_completo 
          nombresPersona+ " "+ apellidosPersona
      end
end
 