class ExperiencesController < ApplicationController
    def new
      if @concert = Concert.find_by_id(params[:concert_id])
        @experience = @concert.experiences.build
      else
        @experience = Experience.new
      end
    end
    
    def create
      @experience = current_user.experiences.build(experience_params)
      if @experience.save
        redirect_to experience_path(@experience)
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
        params.require(:experience).permit(:concert_id, :content, :rating)
      end

    end