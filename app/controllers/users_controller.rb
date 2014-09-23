class UsersController < ApplicationController
  def index
    @users = User.rank(:position).paginate(page: params[:page], per_page: 20)
    @page = params[:page].nil? ? 1 : params[:page]
  end

  def sort
    @user = User.find(params[:id])
    @user.position = params[:position].to_i - 1 + (params[:page].to_i - 1) * 20
    respond_to do |format|
      if @user.save!
        format.json { head :ok }
      else
        format.json { head :error }
      end
    end
  end

  private

  def collection
    @users = User.gsub(/^/, '@').to_sym
    instance_variable_set(@users, User.rank(:position).all)
  end

  def user_params
      params.require(:user).permit(:name, :latname, :phone, :email, :position)
    end
end
