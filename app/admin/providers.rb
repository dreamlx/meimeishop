ActiveAdmin.register Provider do
  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :logo,  :sn, :product, :price, :quantity, :avatar, :user_id, 
                :main_category_id, :sub_category_id, :main_category, :sub_category
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

  collection_action :get_sub_category, :method => :get do
    @main_category_id = params[:main_category_id]
    @sub_categories = Category.where("parent_id = ?", @main_category_id)
    render :json => @sub_categories.to_json(:only => [:id, :name]) and return
  end

  controller do
    def new
      @provider = Provider.new
      @main_categories = Category.order("id asc").where("parent_id is null")
      @sub_categories = Category.order("id asc").where("parent_id = ?", @main_categories.first.id)
    end

    def edit
      @main_categories = Category.order("id asc").where("parent_id is null")
      @sub_categories = Category.order("id asc").where("parent_id = ?", @main_categories.first.id)
    end
  end



  form do |f|
    f.semantic_errors
    
    f.inputs '供应内容' do
      f.input :title
      f.inputs 'logo', :multipart => true do
        f.input :logo, as: :file, hint: (image_tag(f.object.logo.url, size: '256x256') if !f.object.new_record? and !f.object.logo.url.nil?)
        f.input :logo_cache, as: :hidden
      end
      f.input :main_category_id, :as => :select, :collection => main_categories, :include_blank => true, selected: f.object.main_category_id
      f.input :sub_category_id, :as => :select,  :input_html => {'data-option-dependent' => true, 'data-option-url' => '/categories/:get_sub_category', 'data-option-observed' => 'provider_sub_category_id'}, :collection => (f.object.main_category_id ? f.object.main_category.sub_categories.collect {|item| [item.name, item.id]} : []) 
    
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

      row '分类' do 
        link_to("#{provider.main_category.name} || #{provider.sub_category.name}",'#')
      end 

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
    # column :main_category
    # column :sub_category
    # column :quantity
    column :created_at

    actions

  end
  
end
