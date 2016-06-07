class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible 	:nombre_empresa, :rut_empresa, :email_persona, :apellidos_persona, :nombres_persona, 
       					:rut_persona, :grado_id , :email, :password, :password_confirmation ,:tipo_id

  has_many :ideas #tiene muchos 
  has_many :denuncia
  #has_one :estado
  belongs_to :grado
  belongs_to :tipo

   validates  :nombre_empresa, presence: true , length: { minimum: 3 } , uniqueness: true
   validates  :email, presence: true , length: { minimum: 3} 
   validates  :rut_empresa, presence: true , length: { minimum:3} , uniqueness: true , numericality: true
   validates  :nombres_persona, presence: true , length: { minimum: 3}
   validates  :apellidos_persona, presence: true, length: { minimum: 3}
   validates  :rut_persona, presence: true , length: { minimum: 3 } , uniqueness: true , numericality: true
   validates  :email_persona, presence: true , length: { minimum: 3}
   #validates  :password, length: { minimum: 8} , confirmation: true
   #validates  :password_confirmation , length: { minimum: 8}, presence: true
   validates  :grado_id, presence: true, numericality: true 

   #validates  :termino_de_uso, acceptance: { accept: 'yes'}
     def  nombre_completo 
          nombres_persona+ " "+ apellidos_persona
      end
end
 