class UltimateTeamsController < ApplicationController
  # GET /ultimate_teams
  # GET /ultimate_teams.json
  def index
    @ultimate_teams = UltimateTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ultimate_teams }
    end
  end

  # GET /ultimate_teams/1
  # GET /ultimate_teams/1.json
  def show
    @ultimate_team = UltimateTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ultimate_team }
    end
  end

  # GET /ultimate_teams/new
  # GET /ultimate_teams/new.json
  def new
    @ultimate_team = UltimateTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ultimate_team }
    end
  end

  # GET /ultimate_teams/1/edit
  def edit
    @ultimate_team = UltimateTeam.find(params[:id])
  end

  # POST /ultimate_teams
  # POST /ultimate_teams.json
  def create
    @ultimate_team = UltimateTeam.new(params[:ultimate_team])

    respond_to do |format|
      if @ultimate_team.save
        format.html { redirect_to @ultimate_team, notice: 'Ultimate team was successfully created.' }
        format.json { render json: @ultimate_team, status: :created, location: @ultimate_team }
      else
        format.html { render action: "new" }
        format.json { render json: @ultimate_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ultimate_teams/1
  # PUT /ultimate_teams/1.json
  def update
    @ultimate_team = UltimateTeam.find(params[:id])

    respond_to do |format|
      if @ultimate_team.update_attributes(params[:ultimate_team])
        format.html { redirect_to @ultimate_team, notice: 'Ultimate team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ultimate_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ultimate_teams/1
  # DELETE /ultimate_teams/1.json
  def destroy
    @ultimate_team = UltimateTeam.find(params[:id])
    @ultimate_team.destroy

    respond_to do |format|
      format.html { redirect_to ultimate_teams_url }
      format.json { head :ok }
    end
  end
end
