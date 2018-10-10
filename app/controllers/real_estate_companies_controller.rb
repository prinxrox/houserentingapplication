class RealEstateCompaniesController < ApplicationController
  before_action :set_real_estate_company, only: [:show, :edit, :update, :destroy]

  # GET /real_estate_companies
  # GET /real_estate_companies.json
  def index
    @real_estate_companies = RealEstateCompany.all
  end

  # GET /real_estate_companies/1
  # GET /real_estate_companies/1.json
  def show
    @real_estate_company = RealEstateCompany.find(params[:id])
  end


  # GET /real_estate_companies/new
  def new
    @real_estate_company = RealEstateCompany.new
  end

  # GET /real_estate_companies/1/edit
  def edit
  end

  # POST /real_estate_companies
  # POST /real_estate_companies.json
  def create
    @real_estate_company = RealEstateCompany.new(real_estate_company_params)

    respond_to do |format|
      if @real_estate_company.save
        format.html { redirect_to @real_estate_company, notice: 'Real estate company was successfully created.' }
        format.json { render :show, status: :created, location: @real_estate_company }
      else
        format.html { render :new }
        format.json { render json: @real_estate_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_estate_companies/1
  # PATCH/PUT /real_estate_companies/1.json
  def update
    respond_to do |format|
      if @real_estate_company.update(real_estate_company_params)
        format.html { redirect_to @real_estate_company, notice: 'Real estate company was successfully updated.' }
        format.json { render :show, status: :ok, location: @real_estate_company }
      else
        format.html { render :edit }
        format.json { render json: @real_estate_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estate_companies/1
  # DELETE /real_estate_companies/1.json
  def destroy
    @real_estate_company.destroy
    respond_to do |format|
      format.html { redirect_to real_estate_companies_url, notice: 'Real estate company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate_company
      @real_estate_company = RealEstateCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def real_estate_company_params
      params.require(:real_estate_company).permit(:name, :website, :address, :size, :founded, :revenue, :synopsis)
    end
end
