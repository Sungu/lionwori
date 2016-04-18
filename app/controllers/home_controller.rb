class HomeController < ApplicationController
  def index
    @post = Post.paginate(page: params[:page], :per_page => 5)
  end
end
