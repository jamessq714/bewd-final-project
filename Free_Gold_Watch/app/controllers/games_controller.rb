class GamesController < ApplicationController
	before_action :load_game, only: [:edit, :show, :update]

	def index
		@games = Game.search_for(params[:q])
	end

	def new
		@game = Game.new
	end

	def show
		@game = Game.find(params[:id])
		@score = Score.new
    	#@scores = Score.search_for(params[:q])
	end

	def create
		@game = Game.new(game_params)
		@game.active = true
		#@game.pintype = true

		if @game.save
			redirect_to @game
    	else
      		render 'new'
	    end
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])
		@game.update game_params
		redirect_to @game
	end

private
    def game_params
      params.require('game').permit(:name, :year_released, :pintype)
    end

		def load_game
			@game = Game.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:notice] = "Invalid game ID #{params[:id]}"
			redirect_to root_path
		end	

end
