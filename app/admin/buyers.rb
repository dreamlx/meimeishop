ActiveAdmin.register Buyer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :sn, :product, :quantity, :contact, :description, :avatar
  #
  # or
  #
  # permit_params do
  #   permitted = [:sn, :product, :quantity, :contact, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs '需求内容' do
      f.input :title
      f.input :product
      f.input :quantity
      f.input :contact
      f.input :description

      f.inputs '商品图片', :multipart => true do
        f.input :avatar, as: :file, hint: (image_tag(f.object.avatar.url) if !f.object.new_record? and !f.object.avatar.url.nil?)
        f.input :avatar_cache, as: :hidden
      end

    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :product
      row :quantity
      row :contact
      row :description
      row '商品图片' do
				image_tag buyer.avatar.url unless buyer.avatar.url.nil?
			end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column '商品图片' do |provider|
      link_to image_tag("#{provider.avatar.url}", size: '128x128'), image_path("#{provider.avatar.url}"), :target => "_blank"
    end
    column :title
    column :product
    column :quantity
    actions
  end
  
end
