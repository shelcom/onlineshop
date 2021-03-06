class CommentsController < ApplicationController
 before_action :set_comment, only: [:show, :destroy]
 before_action :authenticate_user!, except: [:index, :show]
	

	def create
		@instrument = Instrument.find(params[:instrument_id])
	 	@comment = @instrument.comments.create(comment_params.merge(user_id: current_user.id))
		@comment = current_user.comments.build
		@comment.user_id = current_user.id
		flash[:notice] = "Your comment create!"
		redirect_to instrument_path(@instrument)	
	end

	def destroy
		@instrument = Instrument.find(params[:instrument_id])
		@comment = @instrument.comments.find(params[:id])
        if current_user.id == @comment.user_id
        @comment.destroy
        flash[:notice] = 'Your comment destroy!'
        redirect_to instrument_path(@instrument)
		else
	    flash[:notice] = 'You cannot destroy this comment!' 
	    redirect_to instrument_path(@instrument)
		end
	end

	private 
	
	def set_comment
	unless current_user
        @comment = Comment.find(params[:id])
    end
    end
	
	def comment_params
	 params.require(:comment).permit(:username, :name, :comment)
	end
end
