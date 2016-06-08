class BaseForm
  include ActiveModel::Model

  def initialize(attributes={})
    @errors = ActiveModel::Errors.new(self)
    set_attributes(attributes)
  end

  def persisted?
    defined? @id
  end

  def set_attributes(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end
