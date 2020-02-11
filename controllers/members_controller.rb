require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
include FileUtils::Verbose
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do
  if params[:name_query]
    @members = Member.search_by_name(params[:name_query])
  else
    @members = Member.all
  end
  # @members = Member.search_by_name(params[:search_by_name])
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

post '/members/:id/upload-image' do
    tempfile = params[:file][:tempfile]
    filename = params[:file][:filename]
    cp(tempfile.path, "public/images/#{filename}")
    member = Member.find(params[:id])
    member.image = filename
    member.update
    redirect("/members/#{params[:id]}")
end



#EDIT CLIENT
get "/members/:id/edit" do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect ("/members")
end

#DELETE CLIENT
get "/members/:id/delete" do
  @member = Member.find(params[:id])
  erb(:"members/delete")
end

post '/members/:id/delete' do
  member = Member.find(params[:id])
  member.delete()
  redirect ("/members")
end

get "/members/:id/workouts" do
  @member = Member.find(params[:id])
  erb(:"/members/workouts_booked")
end
