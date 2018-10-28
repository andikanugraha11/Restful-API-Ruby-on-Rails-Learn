class HomeController < ApplicationController

    def index
        @user = User.all
        render json: {
            values: @user,
            message: "success",
        },status:200
    end

    def show
        @user = User.find_by_id(params[:id])
        if @user.present?
            render json:{
                values: @user,
                message: "success",
            },status: 200
        else
            render json:{
            values: "",
            message: "no data !",
            },status: 400
        end
    end

end
