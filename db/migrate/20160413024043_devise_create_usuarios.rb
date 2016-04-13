class DeviseCreateUsuarios < ActiveRecord::Migration
  def change
    create_table(:usuarios) do |t|
      ## Database authenticatable
      t.string :usuarios_email,              null: false, default: ""
      t.string :usuariosencrypted_password, null: false, default: ""
      t.integer :usuarios_grado_ID
      t.string :usuarios_nombre_empresa
      t.integer :usuarios_persona_ID
      ## Recoverable
      t.string   :usuarios_reset_password_token
      t.datetime :usuarios_reset_password_sent_at

      ## Rememberable
      t.datetime :usuarios_remember_created_at

      ## Trackable
      t.integer  :usuarios_sign_in_count, default: 0, null: false
      t.datetime :usuarios_current_sign_in_at
      t.datetime :usuarios_last_sign_in_at
      t.inet     :usuarios_current_sign_in_ip
      t.inet     :usuarios_last_sign_in_ip

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

    add_index :usuarios, :usuarios_email,                unique: true
    add_index :usuarios, :usuarios_reset_password_token, unique: true
    # add_index :usuarios, :confirmation_token,   unique: true
    # add_index :usuarios, :unlock_token,         unique: true
  end
end
