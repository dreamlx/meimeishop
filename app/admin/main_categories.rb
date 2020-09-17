ActiveAdmin.register MainCategory do

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

    # sidebar "子分类", only: [:show, :edit] do
    #     ul do
    #       li link_to "子分类",    admin_main_category_sub_categories_path(resource)
    #     end
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
  