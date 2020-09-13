ActiveAdmin.register Provider do
  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :logo, :qrcode, :sn, :product_name, :price, :stock, :avatar
                # pictures_attributes: [:id,:name, :imageable_id, :imageable_type, :avatar, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :logo, :qrcode, :sn, :product_name, :price, :stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  filter :title
  filter :product_name
  filter :created_at

  form do |f|
    f.semantic_errors
    
    
    f.inputs '供应内容' do
      f.input :title
      f.input :logo
      f.input :qrcode
      f.input :product_name
      f.input :avatar
      f.input :price
      f.input :stock
    end

    f.inputs '商品图片', :multipart => true do
			f.input :avatar, as: :file, hint: (image_tag(f.object.avatar.url) if !f.object.new_record? and !f.object.avatar.url.nil?)
			f.input :avatar_cache, as: :hidden
    end

    # f.inputs '商品图片', :multipart => true do
    #   f.has_many :pictures, new_record: false do |b|
    #     b.input :avatar, as: :file, hint: (image_tag(f.object.avatar.url + qiniu_deal) if !f.object.new_record? and !f.object.avatar.url.nil?)
    #     b.input :avatar_cache, as: :hidden
    #   end
    # end

    f.actions
  end

  show do
    attributes_table do
      row :title
      row I18n.t('activerecord.attributes.provider.logo') do
				image_tag provider.logo.url unless provider.logo.url.nil?
			end
      row I18n.t('activerecord.attributes.provider.qrcode') do
				image_tag provider.qrcode.url unless provider.qrcode.url.nil?
			end
      row :product_name
      row :price
      row :stock
      row '商品图片' do
				image_tag provider.avatar.url unless provider.avatar.url.nil?
			end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column '商品图片' do |provider|
      unless provider.avatar.url.nil?
        link_to image_tag("#{provider.avatar.url}", size: '128x128'), image_path("#{provider.avatar.url}"), :target => "_blank" 
      else
        '暂无图片'
      end
    end
    column :title
    column :product_name
    column :price
    column :stock
    column :created_at

    actions

  end
  
end
