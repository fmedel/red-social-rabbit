 
class UsersEditarController < ApplicationController
  #before_filter :authenticate_user! 
###########################################################################################################3
   Ruta_directorio_archivos_fotos = "public/fotos/"; 
  def subir_foto_de_perfil
    if  user_signed_in?
      @formato_erroneo = false; 
      if request.post?
         #Archivo subido por el usuario.
         archivo = params[:archivo];
         #Nombre original del archivo.
         nombre_original = "archivo_fotos_"+(current_user.id).to_s+"_"+archivo.original_filename;
         #Directorio donde se va a guardar.
         directorio = Ruta_directorio_archivos_fotos;
         #Extensión del archivo.
         extension = nombre_original.slice(nombre_original.rindex("."), nombre_original.length).downcase;
         #Verifica que el archivo tenga una extensión correcta.
         nombre = "VT1YUIG2BE9SW"+(@current_user.tipo_id).to_s+"N2O9P3RJMD"+extension;
         if extension == ".jpg"
            #Ruta del archivo.
            path = File.join(directorio, nombre);
            #Crear en el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
            resultado = File.open(path, "wb") { |f| f.write(archivo.read) };
            #Verifica si el archivo se subió correctamente.
            if resultado
               subir_archivo = "ok";
            else
               subir_archivo = "error";
            end
            #Redirige al controlador "archivos", a la acción "lista_archivos" y con la variable de tipo GET "subir_archivos" con el valor "ok" si se subió el archivo y "error" si no se pudo.
            redirect_to inicio_path , notice: 'La imagen fue subida correctamente '
         else
            redirect_to inicio_path, alert:'El formato del archivo ingresado es incorrecto. Usted sólo puede subir archivos .jpg'
            #@formato_erroneo = true;
         end
      end
    else
      redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end
 end

##############################################################################################################################
  def  tipo
    if (params["tipo"]=="empresa"|| params["tipo"]=="encargado" || params["tipo"]=="rubros"|| params["tipo"]=="clave") 
      if  user_signed_in?
        @user = User.find(current_user.id)
        @grados= Grado.all
        if params["tipo"]=="rubros"
          @rubros=Rubro.where("user_id= ?", @current_user.id)
          @Rubro = Rubro.new
        else 
        end
      else 
           redirect_to registrar_path, alert: 'Primero debe estar registrado'
      end 
    else
      redirect_to registrar_path, alert: 'acceso denegado'
    end 
  end

  def index
    if  user_signed_in?
      @user = User.find(params["perfil"])
      @grados= Grado.all
    else 
        redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

  def show
    if  user_signed_in?
       @grados= Grado.all
      @user = User.find(current_user.id)
    end 
  end

  def edit
    if  user_signed_in?
       @grados= Grado.all
       @user = User.find(current_user.id)
    else
        redirect_to registrar_path, alert: 'Primero debe estar registrado'
    end 
  end

   def update
       if  user_signed_in?
         @user = User.find(current_user.id)
        respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to inicio_path } 
        else
          format.html { render :edit }
        end
        end
        else
            redirect_to registrar_path, alert: 'Primero debe estar registrado'
        end 
  end

  def sing_up
    redirect_to registrar_path, alert: 'acceso denegado'
  end 
  def new
      @user = User.new
  end
  def create
      @user = User.new(
        tipo_id: 1 ,
        nombre_empresa: params['user']['nombre_empresa']  ,
        rut_empresa: params['user']['rut_empresa'] ,
        email_persona:  params['user']['email_persona'] ,
        apellidos_persona:  params['user']['apellidos_persona'],
        nombres_persona:params['user']['nombres_persona'] ,
        rut_persona: params['user']['rut_persona'],
        grado_id: params['user']['grado_id'],
        email: params['user']['email'] ,
        password:params['user']['password']
      )
      if @user.save
          redirect_to inicio_path, notice: 'user guardado ccorrectamente ' 
       else
         render :new 
      end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombre_empresa, :rut_empresa, :email_persona, :apellidos_persona, :nombres_persona, :rut_persona, :grado_id , :email, :password, :password_confirmation)
    end	
end
