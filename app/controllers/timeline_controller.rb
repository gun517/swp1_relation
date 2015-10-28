class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    def index
        @blogs = Blog.all.reverse
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end
    
    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def destroy
        cc = Comment.find(params[:id])
        cc.destroy
        redirect_to :root
    end
    
    def edit
       @edit = Comment.find(params[:id]) 
    end
    
    def update
        ee = Comment.find(params[:id])
        ee.msg = params[:comment]
        ee.save
        redirect_to :root
    end
    
    def user
        @uu = User.where(email: params[:email]).take
        @blogs = Blog.all
    end
        
    
end
