class ExperiencesController < ApplicationController
  def new
    #if it's nested and why find the post
    if params[:concert_id] && @concert = Experience.find_by_id(params[:concert_id])
      @experience = @concert.experiences.build
    else
      @experience = Experience.new
    end
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      redirect_to experiences_path
    else
      render :new
    end
  end
    
      private
    
      def experience_params
        params.require(:experience).permit(:content, :rating, :concert_id)
      end

    end