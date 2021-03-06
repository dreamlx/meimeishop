class Api::SmallRoutine::WxUsersController < Api::SmallRoutine::BaseController
  # skip_before_filter :verify_authenticity_token, :only => :bind
  before_action :authenticate_user!, except: [:login,:logout,:t_list,:add_record]

  def login
    wxappid = ENV['wxappid']
    wx_select = ENV['wx_select']
    code = params[:code]
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{wxappid}&secret=#{wx_select}&js_code=#{code}&grant_type=authorization_code"
    res = RestClient.get url
    json = JSON.parse(res.body)
    if json["openid"] == nil
      return render json:{status: 400, message: '登录失败' }
    end
    @wx_user = WxUser.find_by(openid: json["openid"])
    if @wx_user.present?
      @wx_user = @wx_user
    else
      @wx_user = WxUser.create!(openid: json["openid"])
    end
    @wx_user.reset_authentication_token!
    render json: {status: 200, message: '登录成功' ,user_token: @wx_user.authentication_token}
  end

  def logout
    @wx_user = WxUser.find_by(authentication_token: params[:user_token])
    @wx_user.authentication_token = ''

    if @wx_user.save!
     render json: {status: 200, message: '退出成功' }
    else
     render json:{status: 400, message: '退出失败' }
    end
  end

  def bind
    @wx_user = @current_wx_user
    @user = User.find_by(phone: params[:phone])
    if params[:phone] == '' || params[:phone] == nil
      return render json: {status: 400, message: "手机号为空"}
    end
    unless @user.present?
      @user = User.create!(phone: params[:phone],password: "password",email: "#{params[:phone]}@emple.com")
    end

    @wx_user.user_id = @user.id
    if @wx_user.save!
      render json: {status: 200, message: '绑定成功' }
    else
      render json:{status: 400, message: '绑定失败' }
    end
  end

  def info
    @record = @current_wx_user
  end

  def update_user_info
    if @current_wx_user.user_id == nil || @current_wx_user.user == nil
      return render json:{status: 400, message: '未绑定手机号' }
    end
    @record = @current_wx_user.user
    if @record.update!(user_params)
      result = [200, '修改成功']
    else
      result = [400, '修改失败']
    end
    render_json(result)
  end

  def t_list
    page = params[:page] || 1
    per = params[:per] || 60
    record = TRecord.order("updated_at desc").group_by(&:number)
    @record = record
  end

  def add_record
    @record = TRecord.find_by(number: params[:number]) || TRecord.new
    @record.number = params[:number]
    @record.title = params[:title]
    @record.describe = params[:describe]

    if @record.save
      result = [200, '创建成功']
    else
      result = [400, '创建失败']
    end
    render_json(result)
  end

  private

  def t_params
    params.permit(:describe, :number, :title)
  end

  def user_params
    params.permit(:email, :phone, :qrcode, :contact, :name)
  end
end
