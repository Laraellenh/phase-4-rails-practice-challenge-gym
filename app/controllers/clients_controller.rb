class ClientsController < ApplicationController

    def show
        client = Client.id
            if client
                render json: client.memberships.all.charge sum
            else
                render json: {error: "client not found"}, status: :not_found

    end
end
