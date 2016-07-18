class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible 	:nombre_empresa, :rut_empresa, :email_persona, :apellidos_persona, :nombres_persona, 
       					:rut_persona, :grado_id , :email, :password, :password_confirmation ,:tipo_id

  has_many :ideas #tiene muchos 
  has_many :denuncia
  has_many :aquirido
  belongs_to :grado
  belongs_to :tipo
  belongs_to :postular
  has_many :mensaje
  has_many :rubro

   validates  :nombre_empresa, presence:  { message: "No puede estar en blanco" } , length: { minimum: 3 } , uniqueness: {message: "no puedes registrar "} 
   validates :email, presence: true , length: { minimum: 3} 
   validates  :rut_empresa,length: { minimum: 3 ,  maximum: 9 , :too_long => "Es muy largo el rut", :too_short => "Es muy corto el rut"} , uniqueness: {message: "ya se encuentra segistrado "}  , numericality: true
   validates  :nombres_persona, presence:  { message: "No puede estar en blanco" } , length: { minimum: 3}
   validates  :apellidos_persona, presence:  { message: "No puede estar en blanco" }, length: { minimum: 3}
   validates  :rut_persona,length: { minimum: 3 ,  maximum: 9 , :too_long => "Es muy largo el rut", :too_short => "Es muy corto el rut"} , uniqueness: {message: "ya se encuentra segistrado "}  , numericality: true
   validates  :email_persona, presence:  { message: "No puede estar en blanco" } , length: { minimum: 3}
   #validates  :password, length: { minimum: 8 ,  maximum: 24 , :too_long => "Es muy largo ", :too_short => "Es muy corto "} , confirmation: true, presence:  { message: "No puede estar en blanco" }
   #validates  :password_confirmation , confirmation: true, presence:  { message: "No puede estar en blanco" }
   validates  :grado_id, presence:  { message: "No puede estar en blanco" }, numericality: true 

   #validates  :termino_de_uso, acceptance: { accept: 'yes'}
     ##################################
     def  nombre_completo 
          nombres_persona+ " "+ apellidos_persona
      end
end
 