class CommentsController < ApplicationController

	
	def create
		@instrument = Instrument.find(params[:instrument_id])
	 	@comment = @instrument.comments.create(params[:comment].permit(:name, :comment))
		redirect_to instrument_path(@instrument)	
	end

	def destroy
		@instrument = Instrument.find(params[:instrument_id])
		@comment = @instrument.comments.find(params[:id])
		@comment.destroy
		redirect_to instrument_path(@instrument)
	end
end
