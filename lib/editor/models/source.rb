module Editor::Models

  class Source

    include ::Mongoid::Document

    field :text, :type => String
    field :language, :type => Integer

    def as_json(options = {})
      attrs = super(options)
      attrs["id"] = attrs["_id"].to_s
      attrs
    end

  end

end

