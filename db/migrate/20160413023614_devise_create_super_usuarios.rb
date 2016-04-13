class DeviseCreateSuperUsuarios < ActiveRecord::Migration
  def change
    create_table(:super_usuarios) do |t|
           ## Database authenticatable
      t.string :super_usuario_email,              null: false, default: ""
      t.string :super_usuario_encrypted_password, null: false, default: ""
      t.string :super_usuario_primer_nombre
      t.string :super_usuario_primer_apellido
      t.string :super_usuario_nombre_perfil
      t.integer :super_usuario_tipo
      t.integer :super_usuario_rut
      ## Recoverable
      t.string   :super_usuario_reset_password_token
      t.datetime :super_usuario_reset_password_sent_at

      ## Rememberable
      t.datetime :super_usuario_remember_created_at

      ## Trackable
      t.integer  :super_usuario_sign_in_count, default: 0, null: false
      t.datetime :super_usuario_current_sign_in_at
      t.datetime :super_usuario_last_sign_in_at
      t.inet     :super_usuario_current_sign_in_ip
      t.inet     :super_usuario_last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :super_usuarios, :super_usuario_email,                unique: true
    add_index :super_usuarios, :super_usuario_reset_password_token, unique: true
    # add_index :super_usuarios, :confirmation_token,   unique: true
    # add_index :super_usuarios, :unlock_token,         unique: true
  end
end
