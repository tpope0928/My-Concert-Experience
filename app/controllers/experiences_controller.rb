class ExperiencesController < ApplicationController
    def new
      if @experience = Experience.find_by_id(params[:concert_id])
        @experience = @concert.experiences.build
      else
        @experience = Experience.new
      end
    end
    
    def create
      #have current_user as well
      @experience = current_user.experiences.build(experience_params)
      if @experience.save
        redirect_to concert_experience_path(@experience)
      else
        render :new
      end
    end
    
    def show
      @experience = Experience.find_by_id(params[:id])
    end
    
    def index
      if @concert = Concert.find_by_id(params[:concert_id])        
        @experiences = @concert.experiences
      else
        @experiences = Experience.all
        end
      end
    
      private
    
      def experience_params
        params.require(:experience).permit(:content, :rating,:concert_id, concert_attributes: [:city, :state, :venue, :date] )
      end

    end