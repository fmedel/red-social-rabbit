
#################################################################################################################################
Tipo.create(descripcion: 'normal')
Tipo.create(descripcion: 'moderador')
Tipo.create(descripcion: 'administrador')
#################################################################################################################################
Grado.create(descripcion: 'Empresas grande')
Grado.create(descripcion: 'Empresas chica')
#################################################################################################################################
Estado.create(descripcion: 'activa')
Estado.create(descripcion: 'revision')
Estado.create(descripcion: 'denunciada')
Estado.create(descripcion: 'eliminada')
Estado.create(descripcion: 'apelacion')
Estado.create(descripcion: 'aceptada')
#################################################################################################################################
User.create(nombre_empresa: 'moderador', rut_empresa: 110, email_persona: 'moderador@moderador.com', apellidos_persona: 'moderador',nombres_persona: 'moderador', rut_persona: 110, grado_id: 1, email: 'moderador@moderador.com',tipo_id: 2,password: 'moderador')
User.create(nombre_empresa: 'administrador', rut_empresa: 111, email_persona: 'administrador@administrador.com', apellidos_persona: 'administrador',nombres_persona: 'administrador', rut_persona: 111, grado_id: 1, email: 'administrador@administrador.com', tipo_id: 3, password: 'administrador')
####################################################################################################################################