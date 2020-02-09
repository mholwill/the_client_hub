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
