class CambiosTabla < ActiveRecord::Migration
  def change 
  	remove_index :users, :rutEmpresa  
    remove_index :users, :nombreEmpresa
    remove_index :users, :rutPersona  
    remove_index :users, :emailPersona
    remove_column :users, :nombreEmpresa
	remove_column :users, :rutEmpresa
	remove_column :users, :emailPersona
	remove_column :users, :apellidosPersona
	remove_column :users, :nombresPersona
	remove_column :users, :rutPersona

  	add_column :users, :nombre_empresa, :string, default: "", null: false
  	add_column :users, :rut_empresa, :integer, default: 0 , null: false
  	add_column :users, :email_persona, :string, default: "", null: false
  	add_column :users, :apellidos_persona, :string, default: "", null: false
  	add_column :users, :nombres_persona, :string, default: "", null: false
  	add_column :users, :rut_persona, :integer, default:  0 , null: false
    add_index :users, :rut_empresa,           unique: true
    add_index :users, :nombre_empresa,        unique: true
    add_index :users, :rut_persona,           unique: true
    add_index :users, :email_persona,         unique: true
  end
end
