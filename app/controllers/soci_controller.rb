class SociController < ApplicationController

     def index
         @listasocis = Listasoci.all

         end

     def show
         id = params[:id]
         if Listasoci.exists?(id)
              @listasoci =Listasoci.find(id)
         else
              render html:'Non esiste'
             end
         end

     def create
         @listasoci = Listasoci.create(params[:listasoci].permit!)
         if @listasoci.save
            redirect_to listasoci_path
         else
           end

         end


     def new

     end

     def edit
          id = params[:id]
          @listasoci = Listasoci.find(id)
     end


     def update
          id = params[:id]
          @listasoci =Listasoci.find(id)
          @listasoci.update_attributes!(params[:listasoci].permit(:nome, :cognome, :indirizzo ))
               redirect_to soci_path(@listasoci)

     end

     def destroy
               id = params[:id]
                @listasoci = Listasoci.find(id)
                @listasoci.destroy
                redirect_to listasoci_path

     end


end



