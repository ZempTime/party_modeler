class PartyRelationshipTypesController < ApplicationController
  before_action :set_party_relationship_type, only: [:show, :edit, :update, :destroy]

  # GET /party_relationship_types
  # GET /party_relationship_types.json
  def index
    @party_relationship_types = PartyRelationshipType.all
  end

  # GET /party_relationship_types/1
  # GET /party_relationship_types/1.json
  def show
  end

  # GET /party_relationship_types/new
  def new
    @party_relationship_type = PartyRelationshipType.new
  end

  # GET /party_relationship_types/1/edit
  def edit
  end

  # POST /party_relationship_types
  # POST /party_relationship_types.json
  def create
    @party_relationship_type = PartyRelationshipType.new(party_relationship_type_params)

    respond_to do |format|
      if @party_relationship_type.save
        format.html { redirect_to @party_relationship_type, notice: 'Party relationship type was successfully created.' }
        format.json { render :show, status: :created, location: @party_relationship_type }
      else
        format.html { render :new }
        format.json { render json: @party_relationship_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /party_relationship_types/1
  # PATCH/PUT /party_relationship_types/1.json
  def update
    respond_to do |format|
      if @party_relationship_type.update(party_relationship_type_params)
        format.html { redirect_to @party_relationship_type, notice: 'Party relationship type was successfully updated.' }
        format.json { render :show, status: :ok, location: @party_relationship_type }
      else
        format.html { render :edit }
        format.json { render json: @party_relationship_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /party_relationship_types/1
  # DELETE /party_relationship_types/1.json
  def destroy
    @party_relationship_type.destroy
    respond_to do |format|
      format.html { redirect_to party_relationship_types_url, notice: 'Party relationship type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_relationship_type
      @party_relationship_type = PartyRelationshipType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def party_relationship_type_params
      params.require(:party_relationship_type).permit(:from_role_id, :to_role_id, :description, :name)
    end
end
