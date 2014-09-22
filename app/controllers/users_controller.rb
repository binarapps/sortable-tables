class UsersController < ApplicationController
  def index
    @users = User.rank(:position).paginate(page: params[:page], per_page: 20)
  end

  def sort
    @user = User.find(params[:id])
    @user.position = params[:position].to_i - 1 + (params[:page].to_i - 1) * 20
    respond_to do |format|
      if @company.save!
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
end
