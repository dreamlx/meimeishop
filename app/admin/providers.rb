ActiveAdmin.register Provider do
  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :logo,  :sn, :product, :price, :quantity, :avatar, :user_id
                # pictures_attributes: [:id,:name, :imageable_id, :imageable_type, :avatar, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :logo, :qrcode, :sn, :product_name, :price, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  filter :title
  filter :product
  filter :created_at

  form do |f|
    f.semantic_errors
    
    f.inputs '供应内容' do
      f.input :title
      f.inputs 'logo', :multipart => true do
        f.input :logo, as: :file, hint: (image_tag(f.object.logo.url, size: '256x256') if !f.object.new_record? and !f.object.logo.url.nil?)
        f.input :logo_cache, as: :hidden
      end
      f.input :product
      f.input :price
      f.input :quantity
      f.input :user_id, :input_html => { :value => current_user.id }, as: :hidden
    end

    f.inputs '商品图片', :multipart => true do
			f.input :avatar, as: :file, hint: (image_tag(f.object.avatar.url, size: '256x256') if !f.object.new_record? and !f.object.avatar.url.nil?)
			f.input :avatar_cache, as: :hidden
    end

    f.actions
  end

  show do
    attributes_table do
      row :title
      row I18n.t('activerecord.attributes.provider.logo') do
				image_tag provider.logo.url, size: '256x256' unless provider.logo.url.nil?
			end
      row :product
      row :price
      row :quantity
      row '商品图片' do
				link_to((image_tag provider.avatar.url, size: '256x256'), provider.avatar.url) unless provider.avatar.url.nil?
      end
      row '---' do
        '---'
      end

      row "发布者" do
        "#{provider.user.name.nil? ? '匿名用户' : provider.user.name}"
      end
      
      row "联系方式" do
        "#{provider.user.contact.nil? ? '无内容' : provider.user.contact}"
      end

      row "qrcode" do
        image_tag provider.user.qrcode.url, size: '128x128' unless provider.user.qrcode.url.nil?
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column '商品图片' do |provider|
      unless provider.avatar.url.nil?
        link_to image_tag("#{provider.avatar.url}", size: '128x128'), image_path("#{provider.avatar.url}"), :target => "_blank" 
      else
        '暂无图片'
      end
    end
    column :title
    column :product
    column :price
    column :quantity
    column :created_at

    actions

  end
  
end
