class Editor::Source

  include ::Mongoid::Document

  field :text, :type => String

  def as_json(options = {})
    attrs = super(options)
    attrs["id"] = attrs["_id"].to_s
    attrs
  end

end

