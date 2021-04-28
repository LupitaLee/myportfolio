class PhotosController < ApplicationController
    before_action :set_photo, only: [:show, :edit, :update, :create, :destroy]


    def index
        @photos = Photos.all
    end

    def new
        @photo = Photo.new 
    end
    def show 
       
    end
    
    def create
        
        if Photo.save
            redirect_to photo_path
        else
            render :new
        end
    end

    def edit 
       
    end

    def update 
       
        @Photo.update(photo_params)
        if @photo.save 
            redirect_to photo_path
        else
            render :edit
        end
    end

    def destroy
     
        @photo.destroy 
        flash[:notice]= "Photo deleted"
        redirect_to photo_path 

    end


    private

    def photo_params
        params.require(:photo).permit(:title, :image)
    end

    def set_photo
        @photo = Photo.find(params[:id])
    end
   
end
