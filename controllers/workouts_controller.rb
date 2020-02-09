require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/workout.rb' )
also_reload( '../models/*' )


get '/workouts' do
  @workouts = Workout.all()
  erb(:"workouts/index")
end

get '/workouts/new' do
  erb(:"workouts/new")
end

post '/workouts' do
  workout = Workout.new(params)
  workout.save()
  redirect ('/workouts')
end

get '/workouts/:id/members' do
  @workout = Workout.find(params[:id])
  erb(:"workouts/members_booked")
end

get '/workouts/:id/edit' do
  @workout = Workout.find(params[:id])
  erb(:"/workouts/edit")
end

post '/workouts/:id' do
  workout = Workout.new(params)
  workout.update
  redirect ('/workouts')
end
