class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
    @post.user_id = params["user_id"]
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = params["post"]["user_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

end
