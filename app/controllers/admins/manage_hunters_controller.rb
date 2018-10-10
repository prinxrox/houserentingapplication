# frozen_string_literal: true

# Controller to manage hunters
class Admins::ManageHuntersController < ApplicationController
  include ApplicationHelper

  before_action :authenticate!

  def index
    @hunters = Hunter.all
  end

  def show
    redirect_to '/admins/manage/hunters'
  end

  def new
    @hunter = Hunter.new
  end

  def create
    @hunter = Hunter.new(allowed_params)

    if @hunter.save
     redirect_to '/admins/manage/hunters', flash: {
          notice: 'Successfully Created!',
          class: 'alert alert-success'
      }
    end
  end

  def edit
    @hunter = Hunter.find(params[:id])
  end

  def update
    @hunter = Hunter.find(params[:id])
    if @hunter.update_attributes(allowed_params)
      redirect_to '/admins/manage/hunters', flash: {
        notice: 'Successfully Updated!',
        class: 'alert alert-success'
      }
    else
      render action: 'edit'
    end
  end

  def destroy
    @hunter = Hunter.find(params[:id])
    notice = { class: 'alert alert-success', notice: 'Successfully Deleted!' }
    unless @hunter.destroy
      notice[:class] = 'alert alert-danger'
      notice[:notice] = @hunter.errors.full_messages
      notice[:notice] = notice[:notice].map { |m| "<span>#{m}</span>" }
      notice[:notice] = notice[:notice].join('<br>')
    end
    redirect_to '/admins/manage/hunters', flash: notice
  end

  protected

  def authenticate!
    return if admin_signed_in?

    redirect_to :root, flash: UNAUTHORIZED_FLASH
  end

  def configure_permitted_parameters
    params.require(:hunter)
        .permit(:name, :phone, :prefcon, :email, :password, :password_confirmation)
  end
  def allowed_params
    params.require(:hunter)
          .permit(:name, :phone, :prefcon, :email, :password, :password_confirmation)
  end
end
