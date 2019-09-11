class CommentsController < ApplicationController
    before_action :authorized?

    def index
        @comments = Comment.all
    end 
    
    def show
        @comment = Comment.find(params[:id])
    end 

    def edit
        @comment = Comment.find(params[:id])
    end 

    def new
        @comment = Comment.new
        @visit = params[:visit_id_for_action]
    end 

    def create
        @comment = Comment.new
        @comment.update(comment_params)
        @comment.save
        redirect_to visit_path(@comment.visit_id)
    end
    
    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to comments_path(@comment)
    end 

    def destroy 
        @comment = comment.find(params[:id])
        @comment.delete
        redirect_to user_path(user)
    end 

    private

    def comment_params
      params.require(:comment).permit(:visit_id, :comment)
    end 

end 