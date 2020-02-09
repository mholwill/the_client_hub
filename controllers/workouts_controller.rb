require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/workout.rb' )
also_reload( '../models/*' )


get '/workouts' do
  @workouts = Workout.all()
  erb(:"workouts/index")
end
