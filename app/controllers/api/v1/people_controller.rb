module Api::V1
  class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :edit, :update, :destroy]
    respond_to :json
    
    # GET /people.json
    def index
      @people = Person.all
      respond_with(@people)
    end

    # GET /people/1.json
    def show
      respond_with(@person)
    end

    # POST /people.json
    def create
      @person = Person.new(person_params)

      respond_with(
        @person.save ?
        { status: :created, location: @person } :
        { json: @person.errors, status: :unprocessable_entity }
      )
    end

    # PATCH/PUT /people/1.json
    def update
      respond_with(
        @person.update(person_params) ?
        { status: :ok, location: @person } :
        { json: @person.errors, status: :unprocessable_entity }
      )
    end

    # DELETE /people/1.json
    def destroy
      @person.destroy
      respond_with( status: :ok ) 
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = Person.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def person_params
        params.permit(:name, :phone)
      end
  end
end