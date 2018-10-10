# frozen_string_literal: true

# Controller to manage realtors
class Admins::ManageRealtorsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate!

  def index
    @realtors = Realtor.all
  end

  def show
    redirect_to '/admins/manage/realtors'
  end

  def new
    @realtor = Realtor.new
  end

  def create
    @realtor = Realtor.new(allowed_params)

    if @realtor.save
      redirect_to '/admins/manage/realtors', flash: {
          notice: 'Successfully Created!',
          class: 'alert alert-success'
      }
    end
  end



  def edit
    @realtor = Realtor.find(params[:id])
  end

  def update
    @realtor = Realtor.find(params[:id])
    if @realtor.update_attributes(allowed_params)
      redirect_to '/admins/manage/realtors', flash: {
        notice: 'Successfully Updated!',
        class: 'alert alert-success'
      }
    else
      render action: 'edit'
    end
  end

  def destroy
    @realtor = Realtor.find(params[:id])
    notice = { class: 'alert alert-success', notice: 'Successfully Deleted!' }
    unless @realtor.destroy
      notice[:class] = 'alert alert-danger'
      notice[:notice] = @realtor.errors.full_messages
      notice[:notice] = notice[:notice].map { |m| "<span>#{m}</span>" }
      notice[:notice] = notice[:notice].join('<br>')
    end
    redirect_to '/admins/manage/realtors', flash: notice
  end

  protected

  def authenticate!
    return if admin_signed_in?

    redirect_to :root, flash: UNAUTHORIZED_FLASH
  end

  def configure_permitted_parameters
    params.require(:realtor)
        .permit(:name, :phone, :real_estate_company, :real_estate_company_id,:email, :password, :password_confirmation)
  end
  def allowed_params
    params.require(:realtor)
          .permit(:name, :phone, :real_estate_company, :real_estate_company_id, :email, :password, :password_confirmation)
  end
end
