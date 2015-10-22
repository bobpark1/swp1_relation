class TimelineController < ApplicationController
    before_action :authenticate_user!,  except: :index
    
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
    
    def edit
        @bb = Blog.find(params[:id])
    end
    
    def update
        bb = Blog.find(params[:id])
        bb.content = params[:naeyong]
        bb.save
        redirect_to :root
    end
    
    def destroy
        bb = Blog.find(params[:id])
        bb.destroy
        redirect_to :root
    end
    
    def cedit
        @bb = Comment.find(params[:id])
    end
    
    def cupdate
        bb = Comment.find(params[:id])
        bb.msg = params[:naeyong]
        bb.save
        redirect_to :root
    end
    
    def cdestroy
        bb = Comment.find(params[:id])
        bb.destroy
        redirect_to :root
    end
    
    def userpage
        @users = User.all
    end
    
    def mypage
        @me = User.find(params[:id])
        @blogs = Blog.where(user_id: params[:id]).reverse
    end
    
    def mywrite
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :back
    end 
end
