class Command
  include ActiveModel::Validations
  include ActiveModel::Serializers::JSON

  class Command::NotImplementedError < StandardError; end

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat vars
    super(*vars)
  end

  def self.attributes
    @attributes ||= []

    super_attributes = superclass.attributes if superclass && superclass.respond_to?(:attributes)
    (super_attributes || []) + @attributes
  end

  def self.from_json(json)
    klass = self.new
    klass.from_json(json)
    klass
  end

  def initialize(params = nil)
    self.attributes = params if params
  end

  def attributes=(params)
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end

  def attributes
    attrs = {}
    self.class.attributes.each do |key|
      attrs[key] = self.public_send("#{key}")
    end
    attrs
  end

  def to_params
    ::HashWithIndifferentAccess.new(attributes_hash)
  end

  def execute
    raise NotImplementedError, "#{self.class.name} does not implement an execute method"
  end

  private

  def settled_attributes
    instance_vars = self.instance_variables.map do |attr|
      attr.to_s[1..-1].to_sym
    end

    instance_vars & attributes.keys
  end

  def attributes_hash
    settled_attributes.inject({}) do |out, attribute|
      value = public_send(attribute)
      out[attribute] = value
      out
    end
  end

end

