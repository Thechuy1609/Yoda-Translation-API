class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def search
    api = YodaApi.new
    translated_text = api.translate(params[:text])

    if translated_text
      @result = translated_text
      flash[:notice] = "Translation: #{translated_text}"
      redirect_to root_path
    else
      redirect_to root_path, alert: "Translation failed."
    end
  end
end
