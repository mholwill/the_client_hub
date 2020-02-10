require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all
  erb(:"members/index")
end


#NEW CLIENT
get '/members/new' do
  erb(:"members/new")
end

post '/members' do
  member = Member.new(params)
  member.save()
  redirect ('/members')
end

get '/members/:id' do
  @member = Member.find(params[:id])
  erb(:"members/show")
end



#EDIT CLIENT
get "/members/:id/edit" do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect ('/members')
end

#DELETE CLIENT
post '/members/:id/delete' do
  member = Member.find(params[:id])
  member.delete()
  redirect ('/members')
end

get "/members/:id/workouts" do
  @member = Member.find(params[:id])
  erb(:"/members/workouts_booked")
end
