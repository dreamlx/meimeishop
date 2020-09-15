ActiveAdmin.register Buyer do
  menu priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :sn, :product, :quantity, :contact, :description, :avatar, :title, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:sn, :product, :quantity, :contact, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :title
  filter :product
  filter :created_at
  
  form do |f|
    f.semantic_errors

    f.inputs '需求内容' do
      f.input :title
      f.input :product
      f.input :quantity
      f.input :description
      f.input :user_id, :input_html => { :value => current_user.id }, as: :hidden

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
      row :description
      row '商品图片' do
				image_tag buyer.avatar.url unless buyer.avatar.url.nil?
      end

      row '---' do
        '---'
      end

      row "发布者" do
        "#{buyer.user.name.nil? ? '匿名用户' : buyer.user.name}"
      end
      
      row "联系方式" do
        "#{buyer.user.contact.nil? ? '无内容' : buyer.user.contact}"
      end

      row "qrcode" do
        image_tag buyer.user.qrcode.url, size: '128x128' unless buyer.user.qrcode.url.nil?
      end
    end

    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column '商品图片' do |buyer|
      unless buyer.avatar.url.nil?
        link_to image_tag("#{buyer.avatar.url}", size: '128x128'), image_path("#{buyer.avatar.url}"), :target => "_blank"
      else
        '暂无图片'
      end
    end
    column :title
    column :product
    column :quantity
    column :created_at
    actions
  end
  
end
