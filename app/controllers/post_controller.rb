class PostController < ApplicationController
  before_action:authenticate_user!, only: [:new,:create,:show,:edit,:update,:destroy]
  
  def index
  end

  def new
  end
  
  def create
    a = Post.create(title: params[:title], 
                    region: params[:region],
                    day: params[:day],
                    purpose: params[:purpose],
                    people: params[:people],
                    dday: params[:dday],
                    content: params[:content],
                    user_id: current_user.id)
    flash[:notice] = "글이 작성 되었습니다"
    redirect_to "/post/show/#{a.id}"
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    a = Post.find(params[:id])
    if a.user_id == current_user.id
      a.title = params[:title]
      a.region = params[:region]
      a.day = params[:day]
      a.purpose = params[:purpose]
      a.people = params[:people]
      a.dday =  params[:dday]
      a.content = params[:content]
      a.save
      flash[:notice] = "글이 수정 되었습니다"
      redirect_to "/post/show/#{a.id}"
    else
      flash[:error] = "잘못된 접근입니다."
      redirect_to "/post/show/#{a.id}"
    end
  end
  
  def destroy
    a=Post.find(params[:id])
    if a.user_id == current_user.id
      a.destroy
      flash[:notice] = "글을 지웠습니다"
      redirect_to '/'
    else
      flash[:error] = "잘못된 접근입니다."
      redirect_to "/post/show/#{a.id}"
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def add_applicant
    @post = Post.find(params[:post_id])
    if @post.applicants.count < @post.people
      Applicant.create(user_id: current_user.id,
                       post_id: params[:post_id])
      flash[:notice] = "모임에 지원 신청 하셨습니다"
      redirect_to :back
    else
      flash[:notice] = "모임이 가득 찼습니다"
      redirect_to :back
    end
  end
  
  def del_applicant
    @post = Post.find(params[:post_id])
    b = @post.applicants.where(user_id: current_user.id)[0]
    b.destroy
    flash[:notice] = "모임에 지원 취소 하셨습니다"
    redirect_to :back
  end
end
