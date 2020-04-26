class BaseModelStruct
  def with_params(params)
    self.class.new(to_params.merge(params))
  end

  def to_params
    instance_values.symbolize_keys
  end

  alias to_hash to_params
end
