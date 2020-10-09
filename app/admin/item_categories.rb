ActiveAdmin.register ItemCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :parent_id


  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :parent_id, :as => :select, :collection => SubCategory.all, :include_blank => false, selected: f.object.parent_id
      f.input :name
    end
    f.actions
  end

end
