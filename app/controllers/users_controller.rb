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

     # POST /login
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  # POST /signup
  def signup
    user = User.create(user_params)
    if user.valid?
      token = JsonWebToken.encode({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /me
  def me
    render json: @current_user
  end

  # PATCH /me
  def update
    @current_user.update(bio: params[:bio], image: params[:image])
    render json: @current_user
  end


end
