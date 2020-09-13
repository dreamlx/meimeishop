ActiveAdmin.register Picture do
  menu false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :imageable_id, :imageable_type, :avatar
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :imageable_id, :imageable_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
