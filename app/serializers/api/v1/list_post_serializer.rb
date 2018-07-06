class Api::V1::ListPostSerializer < ActiveModel::Serializer
	attr_reader :posts

  def initialize args
    @posts = args[:posts]
  end

  def generate
    {
      # current_page: posts.current_page,
      count: posts.size,
      # total_pages: posts.total_pages,
      # total_count: posts.total_count,
      posts: ActiveModelSerializers::SerializableResource.new(posts,
        each_serializer: Api::V1::PostSerializer)
    }
  end
end