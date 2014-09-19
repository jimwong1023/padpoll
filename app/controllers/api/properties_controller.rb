class Api::PropertiesController < ApplicationController
	respond_to :json

	def index
		respond_with(@properties = Property.all)
	end

	def create
		@property = Property.new(property_params)
		if @property.save
			respond_with(@property, location: nil)
		else
			respond_with(@property.errors, location: nil)
		end
	end

	def destroy
		Property.find(params[:id]).destroy
	end

	def show
	end

	private

		def property_params
			params.require(:property).permit(:address, :city, :state, :zip)
		end
end