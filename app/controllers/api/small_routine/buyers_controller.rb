class Api::SmallRoutine::BuyersController < Api::SmallRoutine::BaseController
  before_action :authenticate_user!
  before_action :set_record, only: [:show, :update, :upload, :destroy]

  def index
    page = params[:page] || 1
    per = params[:per] || 20
    type = params[:type]
    if type == "all"
      record = Buyer.all.order("created_at desc")
    elsif type == "own"
      record = Buyer.where(user_id: @current_wx_user.user_id).order("created_at desc")
    else
      record = Buyer.where(user_id: params[:user_id]).order("created_at desc")
    end
    record = record.ransack(q_params).result(distinct: true)
    @record = Kaminari.paginate_array(record).page(page).per(per)
  end

  def show
  end

  def create
    if @current_wx_user.user_id == nil || @current_wx_user.user_id == ""
      return render json: {status: 400, message: "您未绑定手机号，不能创建"}
    end

    @record = Buyer.new(buyer_params)
    @record.avatar = open(params[:avatar_url]) if params[:avatar_url]
    @record.user_id = @current_wx_user.user_id
    if @record.save
      result = [200, '创建成功']
    else
      result = [400, '创建失败']
    end
    render_json(result)
  end

  def update
    if @current_wx_user.user_id != @record.user_id
      return render json: {status: 400, message: "不是本人创建,无法修改"}
    end
    if @record.update!(buyer_params)
      result = [200, '修改成功']
    else
      result = [400, '修改失败']
    end
    render_json(result)
  end

  def upload
    if @current_wx_user.user_id != @record.user_id
      return render json: {status: 400, message: "不是本人创建,无法修改"}
    end
    if @record.update!(buyer_params)
      result = [200, '修改成功']
    else
      result = [400, '修改失败']
    end
    render_json(result)
  end

  def destroy
    if @current_wx_user.user_id != @record.user_id
      return render json: {status: 400, message: "不是本人创建,无法删除"}
    end

    if @record.destroy
      result = [200, '删除成功']
    else
      result = [400, '删除失败']
    end
    render_json(result)
  end

  private

  def set_record
    @record = Buyer.find(params[:id])
  end

  def buyer_params
    params.permit(:sn, :product, :quantity, :description, :avatar, :avatar_url, :title, :user_id)
  end

  def q_params
    if params[:q]
      params.require(:q).permit(:sn_cont, :title_cont, :quantity_eq, :description_cont, :product_cont, :created_at_gteq, :created_at_lteq, :user_name_cont)
    end
  end

end
