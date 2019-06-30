class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy, :org_type, :is_validator, :is_producer]

  def org_type
    respond_to do |format|
      format.json { render json: @organization.org_type, status: :ok }
    end
  end

  def get_readable_fields
    respond_to do |format|
      format.json { render json: @organization.readable_ids }
    end
  end

  def get_writable_fields
    respond_to do |format|
      format.json { render json: @organization.writable_ids }
    end
  end

  def update_entity_info
    organization_id = params[:org_id]
    entity_id = params[:entity_id]
    key = params[:key]
    value = params[:value]
    org = Organization.find(organization_id.to_i)
    entity = Entity.find(entity_id.to_i)
    respond_to do |format|
      if org.writable_ids.split(",").include? key
        entity[key] = value
        entity.save!
        format.json { render json: true, status: :ok }
      else
        format.json { render json: false, status: :ok }
      end
    end
  end

  def validate_entity_info
    organization_id = params[:org_id]
    entity_id = params[:entity_id]
    key = params[:key]
    value = params[:value]
    org = Organization.find(organization_id.to_i)
    entity = Entity.find(entity_id.to_i)
    respond_to do |format|
      if org.readable_ids.split(",").include? key
        if "#{entity[key]}" == value
          format.json { render json: true, status: :ok }
        else
          format.json { render json: false, status: :ok }
        end
      else
        format.html { render :error }
      end
    end
  end

  def is_validator
    respond_to do |format|
      format.json { render json: @organization.is_validator, status: :ok }
    end
  end

  def is_producer
    respond_to do |format|
      p @organization
      format.json { render json: @organization.is_producer, status: :ok }
    end
  end
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :org_type, :readable_ids, :writable_ids, :is_producer, :is_validator)
    end
end
