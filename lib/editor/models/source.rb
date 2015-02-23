module Editor::Models

  class Source

    include ::Mongoid::Document
    include ::Mongoid::Token

    field :text, :type => String
    field :language, :type => Integer, :default => 1

    def as_json(options = {})
      attrs = super(options)
      attrs["id"] = attrs["token"].to_s
      attrs.delete "_id"
      attrs.delete "token"
      attrs
    end

    token :length => 11

  end

end

