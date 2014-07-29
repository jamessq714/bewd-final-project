class ScoresController < ApplicationController
	def create
    	if user_signed_in?
	        safe_score = params.require(:score).permit(:value).merge(game_id: params[:game_id])
	        @score = current_user.scores.create safe_score
	        redirect_to @score.game
	    end
	end

end
