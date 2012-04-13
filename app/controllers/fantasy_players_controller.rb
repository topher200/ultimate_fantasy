class FantasyPlayersController < ApplicationController
  # GET /fantasy_players
  # GET /fantasy_players.json
  def index
    @fantasy_players = FantasyPlayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fantasy_players }
    end
  end

  def change_status
    fantasy_player = FantasyPlayer.find(params[:id])
    logger.fatal(params[:status])
    if not FantasyPlayer.change_status(fantasy_player, params[:status])
      flash[:error] = "Error changing fantasy player's status"
    end

    redirect_to '/roster/index'
  end

  # GET /fantasy_players/1
  # GET /fantasy_players/1.json
  def show
    @fantasy_player = FantasyPlayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fantasy_player }
    end
  end

  # GET /fantasy_players/new
  # GET /fantasy_players/new.json
  def new
    @fantasy_player = FantasyPlayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fantasy_player }
    end
  end

  # GET /fantasy_players/1/edit
  def edit
    @fantasy_player = FantasyPlayer.find(params[:id])
  end

  # POST /fantasy_players
  # POST /fantasy_players.json
  def create
    @fantasy_player = FantasyPlayer.new(params[:fantasy_player])

    respond_to do |format|
      if @fantasy_player.save
        format.html { redirect_to @fantasy_player, notice: 'Fantasy player was successfully created.' }
        format.json { render json: @fantasy_player, status: :created, location: @fantasy_player }
      else
        format.html { render action: "new" }
        format.json { render json: @fantasy_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fantasy_players/1
  # PUT /fantasy_players/1.json
  def update
    @fantasy_player = FantasyPlayer.find(params[:id])

    respond_to do |format|
      if @fantasy_player.update_attributes(params[:fantasy_player])
        format.html { redirect_to @fantasy_player, notice: 'Fantasy player was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fantasy_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fantasy_players/1
  # DELETE /fantasy_players/1.json
  def destroy
    @fantasy_player = FantasyPlayer.find(params[:id])
    @fantasy_player.destroy

    respond_to do |format|
      format.html { redirect_to fantasy_players_url }
      format.json { head :ok }
    end
  end
end
