class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: not_valie

    def index
        memberships = Membership.all
        render json: memberships
    end
    def create
        m = Membership.create!(params_for_member) 
    end
    private
    def params_for_member
        params.permit(:gym_id, :client_id, :charge)
    end
    def not_valid(invalid)
        render json: {error: invalid.record.full_messages}
    end
end
