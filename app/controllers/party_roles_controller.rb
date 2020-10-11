class PartyRolesController < ApplicationController
  before_action :set_party_role, only: [:show, :edit, :update, :destroy]

  # GET /party_roles
  # GET /party_roles.json
  def index
    @party_roles = PartyRole.all
  end

  # GET /party_roles/1
  # GET /party_roles/1.json
  def show
  end

  # GET /party_roles/new
  def new
    @party_role = PartyRole.new
  end

  # GET /party_roles/1/edit
  def edit
  end

  # POST /party_roles
  # POST /party_roles.json
  def create
    @party_role = PartyRole.new(party_role_params)

    respond_to do |format|
      if @party_role.save
        format.html { redirect_to @party_role, notice: 'Party role was successfully created.' }
        format.json { render :show, status: :created, location: @party_role }
      else
        format.html { render :new }
        format.json { render json: @party_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /party_roles/1
  # PATCH/PUT /party_roles/1.json
  def update
    respond_to do |format|
      if @party_role.update(party_role_params)
        format.html { redirect_to @party_role, notice: 'Party role was successfully updated.' }
        format.json { render :show, status: :ok, location: @party_role }
      else
        format.html { render :edit }
        format.json { render json: @party_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /party_roles/1
  # DELETE /party_roles/1.json
  def destroy
    @party_role.destroy
    respond_to do |format|
      format.html { redirect_to party_roles_url, notice: 'Party role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party_role
      @party_role = PartyRole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def party_role_params
      params.require(:party_role).permit(:party_id, :role_type_id)
    end
end
