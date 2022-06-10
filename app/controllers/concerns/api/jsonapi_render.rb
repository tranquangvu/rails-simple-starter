module API
  module JSONAPIRender
    extend ActiveSupport::Concern

    included do
      include API::Pagination
    end

    def render_resources(resources, options = {})
      serializer_class = options[:each_serializer] || "#{resources.ancestors.first.name}Serializer".constantize
      serializer_options = options.slice(*accepted_jsonapi_serializer_options).merge(is_collection: true)
      serializer_options[:meta] = (serializer_options[:meta] || {}).merge(paginate_meta(options[:pagy])) if options[:pagy]
      render json: serializer_class.new(resources, serializer_options), status: options[:status] || :ok
    end

    def render_resource(resource, options = {})
      serializer_class = options[:serializer] || "#{resource.class.name}Serializer".constantize
      serializer_options = options.slice(*accepted_jsonapi_serializer_options).merge(is_collection: false)
      render json: serializer_class.new(resource, serializer_options), status: options[:status] || :ok
    end

    def render_resource_errors(errors, options = {})
      error = APIError::RecordInvalidError.new(errors)
      render json: APIErrorSerializer.new(error), status: options[:status] || error.status
    end

    private

    def accepted_jsonapi_serializer_options
      %i[meta links include params]
    end
  end
end
