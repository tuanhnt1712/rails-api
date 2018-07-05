class Api::V1::PostsController < Api::V1::BaseController
	def index
		posts = Post.all
    render_success data: Api::V1::ListPostSerializer.new(posts: posts).generate
	end
end
