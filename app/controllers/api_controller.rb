class ApiController < ApplicationController
    before_action :set_default_format 
    
    protect_from_forgery with: :null_session

    skip_before_action :verify_authenticity_token

    private

        def set_default_format
            request.format = :json
        end
end