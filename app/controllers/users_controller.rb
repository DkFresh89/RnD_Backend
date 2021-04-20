class UsersController < ApplicationController

    
    # def newuser
        
    #     @user = params.permit!()

    #     new_user = {
    #         username: @user["username"],
    #         password_digest: @user["password_digest"],
    #         high_score: @user["high_score"],
    #         rank: @user["rank"]
    #     }

    #     User.create(new_user)

    #     render json: @user
    # end

    def index
        @user = User.all
    end

    # # POST /login
    # def login
    #   # find the user based on their username
    #   host = Host.find_by(email: params[:email])
    #   # check their password
    #   if host && host.authenticate(params[:password])
    #     # save the user id in an encoded token
    #     token = JWT.encode({ host_id: host.id }, 'my$ecretK3y', 'HS256')
    #     render json: { host: serialize_model(host, include: ['properties']), token: token }
    #   else
    #     render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    #   end
    # end


        # POST /login
    def login
        
        user = User.find_by(username: params[:username])
        # byebug
        if user && user.authenticate(params[:password])
        token = JsonWebToken.encode({ user_id: user.id }, 'my$ecretK3y', 'HS256')
        render json: { user: user, token: token }
        else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    # POST /signup
    def signup
        # get the user info from the form (params)
        user_params = params.permit(:username, :password_digest, :rank, :high_score)
        # create a new user in the database (User.create)
        user = User.create!(user_params)
        if user.valid?
        # send back a response with new user
        token = JWT.encode({ user_id: user.id }, 'my$ecretK3y', 'HS256')
        render json: { user: user, token: token }, status: :created
        else
        # error messages
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # GET /me
    def show 

    render json: @current_user
    end

    # PATCH /me
    def update
    @current_user.update(bio: params[:bio], image: params[:image])
    render json: @current_user
    end


end
