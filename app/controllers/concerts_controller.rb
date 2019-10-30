class ConcertsController < ApplicationController

    def index
        @concerts = Concert.all
       # if params[:user_id]
       #     @concert = User.find(params[:user_id]).concerts
        #    flash.now[:danger] = "You haven't added any concerts yet!" if @concerts.empty?
        #end
    end

    def new
        @concerts = Concert.new
       # @concert.review.build
    end

    def create
        @concerts = Concert.create(concert_params)
        if @concerts.save
            redirect_to concerts_path
        else
            render :new 
        end
    end

    def show
        @concerts = Concert.find(params[:id])
    end

    private

    def concert_params
        params.require(:concert).permit(:city, :state, :venue, :date, :artist)
    end
    
end
