class TripController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def create
    #first create the 
    user = User.find(params[:user_id])

    trip = Trip.create(
      name: params[:name],
      origin_name: params[:origin_name],
      origin_address: params[:origin_address],
      start_date: params[:start_date].to_date,

      destination_name: params[:destination_name],
      destination_address: params[:destination_address],
      end_date:   params[:end_date].to_date)

    user.user_trips.create(trip: trip)

    trip.save
    user.save

    return render json: {result: trip, count: 1}, status: 200
  end

  def get
    trips = Trip.all()

    if trips
      return render json: {result: trips, count: trips.size}, status: 200
    else
      return render json: {message: "Error saving"}, status: 400
    end
  end

  def get_one
    trip = Trip.find(params[:trip_id])

    if trip
      return render json: {result: trip, count: 1}, status: 200
    else
      return render json: {message: "Error saving"}, status: 400
    end
  end

  def find
    trip = Trip.find_by(name: params[:name])

    if trip
      return render json: {result: trip, count: 1}, status: 200
    else
      return render json: {message: "Error saving"}, status: 400
    end
  end

  def put
  end

  def add_participants
    user = User.find(params[:user_id])

    trip = Trip.find(params[:trip_id])

    trip.user_trips.create(user: user)

    trip.save

    return render json: {result: trip, count: 1}, status: 200
  end

  def get_participants
    trip = Trip.find(params[:trip_id])

    users = trip.user_trips.all()

    stringedUser = Array.new

    users.each do | user |
      user = User.find(user.user_id)

      stringedUser.push(user)
    end

    if users
      return render json: {result: stringedUser, count: users.size}, status: 200
    else
      return render json: {message: "Error retrieving"}, status: 400
    end
  end


  def post_expenses
    expense = Expense.create(
      trip_id: params[:trip_id],
      name:     params[:name],
      price:    params[:price].to_f
      )

    if expense.save
      return render json: {result: expense, count: 1}, status: 200
    else
      return render json: {message: "error creating"}, status: 400
    end
  end

  def get_expenses
    trip = Trip.find(params[:trip_id])

    if trip
      expenses = trip.expenses.all()
      print(expenses)

      return render json: {result: expenses, count: expenses.size}, status: 200
    else
      return render json: {message: "trip not found"}, status: 400
    end
  end

  def post_events
    event = Event.create(
      trip_id:    params[:trip_id],
      name:       params[:name],
      location:   params[:location],
      start_time: params[:start_time],
      end_time:   params[:end_time],
      category:   params[:category])

    if event.save
      return render json: {result: event, count: 1}, status: 200
    else
      return render json: {message: "error creating"}, status: 400
    end
  end

  def get_events
    trip = Trip.find(params[:trip_id])

    if trip
      events = trip.events.all()

      return render json: {result: events, count: events.size}, status: 200
    else
      return render json: {message: "trip not found"}, status: 400
    end
  end

  def post_packings
    packing = Packing.create(
      trip_id:   params[:trip_id],
      item_name: params[:item_name]
    )

    if packing.save
      return render json: {result: packing, count: 1}, status: 200
    else
      return render json: {message: "error creating"}, status: 400
    end
  end

  def get_packings
    trip = Trip.find(params[:trip_id])

    if trip
      packings = trip.packings.all()

      return render json: {result: packings, count: packings.size}, status: 200
    else
      return render json: {message: "trip not found"}, status: 400
    end
  end
  
end
