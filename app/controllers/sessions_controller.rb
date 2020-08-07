class SessionsController < ApplicationController
    
    def new
    end

    def create
        #get user entered login
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            #store encrypted chef_id in session cookie 
            session[:chef_id] = chef.id
            flash[:success] = "You have successfully logged in"
            redirect_to chef_path(chef)
        else
            flash.now[:danger] = "Something's wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:chef_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end