desc "import sku"    #desc 是Rake定义的方法,表示对下面定义任务的描述.这个描述会在使用Rake --tasks(或者Rake -T)命令时输出在屏幕上.
task :load_sku do         #cmd 命令行中执行 rake study_rake 开始执行脚本，task是Rake最重要的方法.它的方法定义是:task(args, &block).任务体是一个block。
  
  filename = ARGV.second
  sku_list = CSV.read(filename, headers:true)

  i = 0
  sku_list.each do |item|
    i += 1
    
    #ID,发布标题,描述,主分类,子分类,三级分类,商品名称,商品单价,库存数量,图片,
    sn = item[0]
    title = item[1]
    description = item[2]
    category1 = item[3]
    category2 = item[4]
    category3 = item[5]
    product = item[6]
    price = item[7]
    market_price = item[8]
    quantity = item[9]
    avatar = item[10]

    puts(title,i)

    # 比较标题是否存在
    
    if Provider.where(:sn => sn).count >0 then
        # update 
        sku = Provider.where(:sn => sn).first
    else
        # new
        sku = Provider.new
    end
    
    sku.user_id = 2
    sku.title = title
    sku.sn = sn
    sku.product = product
    sku.quantity = quantity
    sku.price = price
    sku.description = description

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