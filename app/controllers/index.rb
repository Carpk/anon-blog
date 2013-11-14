
enable :sessions

post '/new' do
  erb :new
end

post '/edit' do
  erb :edit
end

######################## GET ######################

get '/' do
  # Look in app/views/index.erb
  @post = Post.all
  erb :index
end

get '/log_in' do
  erb :log_in
end

get '/create_post' do
  erb :new_post
end

get '/profile' do
  @user = User.find_by_id(session[:user_id])

  erb :profile
end

# redirect will lose instance variables, erb will not

get '/user/:user' do
  erb :user_profile
end


get '/posts/:title' do
 
  erb :post
end

get '/sign_up' do
 erb :signup
end

get '/log_out' do
  session.clear
  redirect to '/'
end

###################### POST ######################

post '/new_post' do
  Post.create(title: params[:title],
               body: params[:post],
               user_id: session[:user_id])
  @user = User.find_by_id(session[:user_id])
  erb :profile
end

post '/log_in' do
  @user = User.find_by_user(params[:user])
  if @user != nil
    if @user && @user.authenticate(params[:password])
    # if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/user/' + params[:user_id]
    else
      
      redirect to '/log_in'
    end
  else
    redirect to '/'
  end
end

# def create
#   user = User.find_by_email(params[:email])
#   if user && user.authenticate(params[:password])
#     session[:user_id] = user.id
#     redirect_to admin_root_path, :notice => "Welcome back, #{user.email}"
#   else
#     flash.now.alert = "Invalid email or password"
#     render "new"
#   end
# end

post '/sign_up' do

  @user = User.new(user: params[:user],
                 email: params[:email],
                 password: params[:password])

  if @user.save
     session[:user_id] = @user.id
     redirect to '/user/' + @user.user
  else
    erb :signup 
  end
  
end





post '/profile/edit' do
  @user = User.find_by_id(session[:id])
  @user.update_attributes(user: params[:user],
                          email: params[:email],
                          password: params[:password])
  redirect '/profile'
end





  # name = User.find_by_user(params[:user])
  # if name == nil

  #  # /.{3,}\@.{3,}\..{2,3}/

  #   @user = User.create(user: params[:user],
  #               email: params[:email],
  #               password: params[:password])
  #   session[:user_id] = @user.id
  #   redirect to '/user/:user'
  # else
  #   #@user.errors[:user] << "User name exists"
  #   error = 'this is wrong'
  #   redirect to '/sign_up'
  # end