ActiveAdmin.register SubCategory do

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

  # belongs_to :main_category
  
  form do |f|
    f.semantic_errors
    
    f.inputs do
      f.input :parent_id, :as => :select, :collection => Category.where("parent_id is null"), :include_blank => false, selected: f.object.parent_id
      f.input :name
    end
    f.actions
  end
  
end
