class MembershipsController < ApplicationController

    def index
        memberships = Membership.all
        render json: memberships
    end
    def create
        m = Membership.create!(params_for_member)
        render json: m, status: :created
    end
    private
    def params_for_member
        params.permit(:gym_id, :client_id, :charge)
    end

end
