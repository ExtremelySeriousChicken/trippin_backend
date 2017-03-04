class UserController < ApplicationController
    #create a new user
    skip_before_filter  :verify_authenticity_token
    def create
        user = User.new(
            name: params[:name])

        if user.save
            user = User.find_by(name: params[:name])
            return render json: {result: user, count: 1}, status: 200
        else
            return render json: {message: "Error saving"}, status: 400
        end
    end

    def get
        user = User.find_by(name: params[:name])

        if user 
            return render json: {result: user, count: 1}, status: 200
        else
            return render json: {message: "Error retrieving"}, status: 400
        end
    end

    def get_trips
        #get the trip
        user = User.find_by(id: params[:id])
        trips = user.user_trips.all()

        stringedTrips = Array.new

        trips.each do | trip |
            trip = Trip.find(trip.trip_id)

            stringedTrips.push(trip)
        end
        
        if trips
            return render json: {result: stringedTrips, count: trips.size}, status: 200
        else
            return render json: {message: "Error retrieving"}, status: 400
        end
    end


end
