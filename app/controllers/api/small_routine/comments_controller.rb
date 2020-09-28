class Api::SmallRoutine::CommentsController < Api::SmallRoutine::BaseController
  before_action :authenticate_user!
  before_action :set_record, only: [:show,:destroy]

  def index
    page = params[:page] || 1
    per = params[:per] || 20
    record = ActiveAdminComment.ransack(q_params).result(distinct: true).order("created_at asc")
    @record = Kaminari.paginate_array(record).page(page).per(per)
  end

  def show
    if @current_wx_user.user_id != @record.author_id
      return render json: {status: 400, message: "不是本人创建,无法查看"}
    end
  end

  def create
    if @current_wx_user.user_id == nil || @current_wx_user.user_id == ""
      return render json: {status: 400, message: "您未绑定手机号，不能创建"}
    end
    @record = ActiveAdminComment.new(comment_params)
    @record.namespace = "admin"
    @record.author_id = @current_wx_user.user_id
    @record.author_type = "User"
    if @record.save
      result = [200, '创建成功']
    else
      result = [400, '创建失败']
    end
    render_json(result)
  end

  

  def destroy
    if @current_wx_user.user_id != @record.author_id
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
    @record = ActiveAdminComment.find(params[:id])
  end

  def comment_params
    params.permit(:namespace, :body, :resource_type, :resource_id, :author_type, :author_id)
  end

  def q_params
    if params[:q]
      params.require(:q).permit(:resource_type_eq, :resource_id_eq, :author_type_eq, :author_id_eq)
    end
  end

end
