  class PeopleController < ApplicationController
    def index
      @people = Person.all
    end
  
    def new
      @person = Person.new
    end
  
    def show
      @person = Person.find(params[:id])
    end
  
    def create
      @person = Person.new(person_params)
      if @person.save
        redirect_to person_path(@person)
      else
        render :new
      end
    end
  
    def edit
      @person = Person.find(params[:id])
    end
  
    def update
      @person = Person.find(params[:id])
      if @person.update(person_params)
        redirect_to person_path(@person)
      else
        render :edit
      end
    end
  
    def destroy
      @person = Person.find(params[:id])
      if @person.destroy
      redirect_to people_path
      else 
         render :new
      end   
    end
  
    private
  
    def person_params
      params.require(:person).permit(:dentificacion, :first_name, :second_name, :first_last_name, :second_last_name, :document_id, :role_id)
    end
  end