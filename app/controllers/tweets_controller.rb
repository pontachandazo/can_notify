class TweetsController < ApplicationController
    before_action :link_index, except: :index
    def index
      @tweets = Tweet.order("created_at DESC").limit(10)
    end

    def new
    end

    def create
      Tweet.create(create_parameter)
      redirect_to controller: :tweets, action: :index
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def link_index
      redirect_to controller: :homes, action: :index unless user_signed_in?
    end

    def update
      tweet = Tweet.find(params[:id])
      tweet.update(update_parameter) if current_user.id == tweet.user_id
    end

    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy if current_user.id == tweet.user_id
    end

    private
    def create_parameter
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
    end

    private
    def update_parameter
      params.permit(:text, :image)
    end
end

