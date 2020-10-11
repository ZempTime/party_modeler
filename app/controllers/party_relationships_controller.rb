class PartyRelationshipsController < ApplicationController
  before_action :set_party_relationship, only: [:show, :edit, :update, :destroy]

  # GET /party_relationships
  # GET /party_relationships.json
  def index
    @party_relationships = PartyRelationship.all
  end

  # GET /party_relationships/1
  # GET /party_relationships/1.json
  def show
  end

  # GET /party_relationships/new
  def new
    @party_relationship = PartyRelationship.new
  end

  # GET /party_relationships/1/edit
  def edit
  end

  # POST /party_relationships
  # POST /party_relationships.json
  def create
    @party_relationship = PartyRelationship.new(party_relationship_params)

    respond_to do |format|
      if @party_relationship.save
        format.html { redirect_to @party_relationship, notice: 'Party relationship was successfully created.' }
        format.json { render :show, status: :created, location: @party_relationship }
      else
        format.html { render :new }
        format.json { render json: @party_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /party_relationships/1
  # PATCH/PUT /party_relationships/1.json
  def update
    respond_to do |format|
      if @party_relationship.update(party_relationship_params)
        format.html { redirect_to @party_relationship, notice: 'Party relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @party_relationship }
      else
        format.html { render :edit }
        format.json { render json: @party_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /party_relationships/1
  # DELETE /party_relationships/1.json
  def destroy
    @party_relationship.destroy
    respond_to do |format|
      format.html { redirect_to party_relationships_url, notice: 'Party relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_relationship
      @party_relationship = PartyRelationship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def party_relationship_params
      params.require(:party_relationship).permit(:from_role_id, :to_role_id, :thru_date)
    end
end
