class HomeController < ApplicationController
    # # Untuk skip check authentication semacam CSRF Token di Laravel
    # skip_before_filter :verify_authenticity_token
    # # Handling ketika data not found saat update, dan delete
    rescue_from ActiveRecord::RecordNotFound, with: :notFound


    def userParams
        params.permit(:name,:age)
    end

    def notFound
        render json:{
            values:{},
            massage:"Data not found",
        },status:400
    end
        
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

    def create
        @user = User.new(userParams)
        if @user.save
            render json:{
                values: @user,
                message: "success",
            },status: 200
        else
            render json:{
            values: "",
            message: "Save failed",
            },status: 400
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(userParams)
            render json:{
                values: @user,
                message: "success",
            },status: 200
        else
            render json:{
            values: "",
            message: "Update failed",
            },status: 400
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json:{
                values: @user,
                message: "success",
            },status: 200
        else
            render json:{
            values: "",
            message: "Save failed",
            },status: 400
        end
    end
end
