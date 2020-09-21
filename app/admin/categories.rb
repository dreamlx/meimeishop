ActiveAdmin.register Category do
  menu false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :parent_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :parent_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    
    f.inputs do
      f.input :name
    end
    f.actions
  end

  controller do
  end
end
