ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :phone, :qrcode, :contact, :name

  index do
    selectable_column
    id_column
    column :phone
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :name

  form do |f|
    f.inputs do
      f.input :phone
      f.input :name
      f.input :qrcode
      f.input :contact
      
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
