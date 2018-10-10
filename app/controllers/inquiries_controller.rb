class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  # GET /inquiries.json
  def index
    house = params[:house_id]
    @inquiries = inquiries_for_hunter(house)
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
    @house = House.find(params[:house_id])

  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(allowed_params)
    @inquiry.house = House.find(params[:inquiry][:house_id])

    @inquiry.hunter = current_hunter


    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def edit
    @inquiry = Inquiry.find(params[:id])
    params[:house_id] = @inquiry.house.id
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update_attributes(allowed_params)

      redirect_to inquiries_path(house_id: @inquiry.house.id),
                  flash: { class: 'alert alert-success',
                           notice: 'Successfully Updated!' }
    else
      render action: 'edit'
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allowed_params
      params.require(:inquiry).permit(:id, :subject, :content, :hunter_id, :house_id)
    end

  def inquiries_for_hunter(house)
    where_clause = "inquiries.hunter_id = #{current_hunter.id}"
    where_clause += house.nil? ? '' : " AND houses.id = #{house}"
    Inquiry.joins(:house).where(where_clause)
  end
end
