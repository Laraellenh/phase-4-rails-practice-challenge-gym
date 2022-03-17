class GymsController < ApplicationController
    
    def index
        render json: Gym.all
    end
    def destroy
        gym = Gym.find(id:params[:id])
        if gym
            gym.destroy
            head :no_content
        else
            render json: {error: "gym not found"}, status: :not_found
    end
    def show
        gym = Gym.find_by (params[:id])
            if gym
                 render json: gym, status: :found
            else
                render json: errors.render_not_found
    end
    private
        def render_not_found(error)
            render json: {error: "#{error.model}" Not Found}, status: :not_found
        end
end
