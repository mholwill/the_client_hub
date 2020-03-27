require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/workout.rb' )
also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.all()
  @member = Member.all()
  @workout = Workout.all()
  erb(:"bookings/index")
end

get '/bookings/new' do
  erb(:"bookings/new")
end

get '/bookings/new/:member_id' do
  @member = Member.find(params[:member_id])
  @workout = Workout.all()
  erb(:"bookings/new")
end

post '/bookings/:member_id' do
  @member = Member.find(params[:member_id])
  @booking = Booking.new(params)
  @booking.save()
  erb(:"bookings/confirm_booking")
end

post '/bookings/:id/delete' do
  booking = Booking.find(params[:id])
  booking.delete()
  redirect ('/bookings')
end
