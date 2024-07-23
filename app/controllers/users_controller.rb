class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :find_user, except: %i(index new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @pagy, @users = pagy(User.sorted_by_created_at, items: Settings.digit_10)
  end

  def show
    @page, @microposts = pagy @user.microposts, items: Settings.digit_10
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t("users.check_mail")
      redirect_to root_url, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t("controller.update")
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("controller.delete_user")
    else
      flash[:danger] = t("controller.delete_fail")
    end
    redirect_to users_path
  end

  def following
    @title = t("controller.following")
    @pagy, @users = pagy @user.following, items: Settings.digit_10
    render :show_follow
  end

  def followers
    @title = t("controller.follower")
    @pagy, @users = pagy @user.followers, items: Settings.digit_10
    render :show_follow
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t("controller.not_find")
      redirect_to root_url
    end
  end

  def correct_user
    return if current_user? @user

    flash[:error] = t("controller.warning")
    redirect_to root_url
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t("controller.please")
    redirect_to login_url
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
