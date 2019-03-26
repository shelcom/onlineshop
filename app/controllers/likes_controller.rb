class LikesController < ApplicationController
 before_action :find_post

  def create
  if already_liked?
    flash[:notice] = "You can't like more than once"
  elsif
    @instrument.likes.create(user_id: current_user.id)
    else 
      redirect_to new_user_session_path  	
  end
  redirect_to instrument_path(@instrument)
end
def already_liked?
  Like.where(user_id: current_user.id, instrument_id:
  params[:instrument_id]).exists? 
end

  private

  def find_post
    @instrument = Instrument.find(params[:instrument_id])
  end
end
