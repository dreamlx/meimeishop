desc "import sku"    #desc 是Rake定义的方法,表示对下面定义任务的描述.这个描述会在使用Rake --tasks(或者Rake -T)命令时输出在屏幕上.
task :load_sku do         #cmd 命令行中执行 rake study_rake 开始执行脚本，task是Rake最重要的方法.它的方法定义是:task(args, &block).任务体是一个block。
  sku_list = CSV.read('tmp/sku20201106.csv', headers:true)

  i = 0
  sku_list.each do |item|
    i += 1
    
    #发布标题,主分类,子分类,三级分类,商品名称,商品单价,库存数量,图片,
    title = item[0]
    sn = ''
    category1 = item[1]
    category2 = item[2]
    category3 = item[3]
    product = item[4]
    price = item[5]
    quantity = item[6]
    avatar = item[7]

    puts(title,i)

    # 比较标题是否存在
    
    if Provider.where(:title => title).count >0 then
        # update 
        sku = Provider.where(:title => title).first
    else
        # new
        sku = Provider.new
    end

    #:title,  :sn, :product, :price, :quantity, :avatar, :user_id,
    #:main_category_id, :sub_category_id, :item_category_id, :item_category, :main_category, :sub_category, :avatar_cache, :description

    sku.user_id = User.first.id
    sku.title = title
    sku.sn = sn
    sku.product = product
    sku.quantity = quantity
    sku.price = price

    if MainCategory.find_by_name(category1).nil?
        category = MainCategory.new
        category.name = category1
        category.save
    end

    sku.main_category_id = MainCategory.find_by_name(category1).id

    if SubCategory.find_by_name(category2).nil?
        category = SubCategory.new
        category.name = category2
        category.parent_id = MainCategory.find_by_name(category1).id
        category.save
    end

    sku.sub_category_id = SubCategory.find_by_name(category2).id

    if ItemCategory.find_by_name(category3).nil?
        category = ItemCategory.new
        category.name = category3
        category.parent_id = SubCategory.find_by_name(category2).id
        category.save
    end

    sku.item_category_id = ItemCategory.find_by_name(category3).id

    if not sku.save! then
        
        puts(sku.errors)
        
    end
  end

  puts(Provider.all.count)
end