class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]


  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all if admin_signed_in? || hunter_signed_in?
    if realtor_signed_in?
      @houses = House.where(real_estate_company_id: current_realtor.real_estate_company_id)
    end
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @house = House.find(params[:id])
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    if (!admin_signed_in?)
    @house.realtor_id=current_realtor.id
    @house.real_estate_company_id=current_realtor.real_estate_company_id
    else
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  class Reg1
    include ActiveModel::Model

    attr_accessor :location, :min_price, :max_price, :min_area,
                  :max_area, :style

    def self.model_name
      ActiveModel::Name.new(self, nil, 'search')
    end
  end

  def search
    if params.include?(:search)
      @search_params = Reg1.new(search_params)
      @houses = find_houses(@search_params)
      if @houses.empty?
        flash[:notice] = 'Sorry no results '
      else
        flash.clear
      end
    else
      @search_params = Reg1.new
      @houses = []
      flash.clear
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:location, :sqft, :yearbuilt, :style, :price, :floors, :basement, :currentowner, :real_estate_company_id, :realtor_id)
    end

  def search_params
    params.require(:search).permit(:location, :min_price, :max_price,
                                   :min_area, :max_area, :style)
  end

  def find_houses(query)
    houses = House.all
    unless query.location.nil? || query.location.empty?
      houses = houses.where('location LIKE ?', "%#{query.location.downcase}%")
    end
    unless query.min_price.nil? || query.min_price.empty?
      houses = houses.where('price >= ?', query.min_price.to_f)
    end
    unless query.max_price.nil? || query.max_price.empty?
      houses = houses.where('price <= ?', query.max_price.to_f)
    end
    unless query.min_area.nil? || query.min_area.empty?
      houses = houses.where('sqft >= ?', query.min_area.to_f)
    end
    unless query.max_area.nil? || query.max_area.empty?
      houses = houses.where('sqft <= ?', query.max_area.to_f)
    end
    houses = houses.where('style LIKE ?', "%#{query.style.downcase}%")
    if realtor_signed_in?
      houses = houses.where(real_estate_company_id: current_realtor.real_estate_company_id)
    end
    houses
  end
end
