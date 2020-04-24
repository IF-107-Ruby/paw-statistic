class BaseModelStruct
  def with_params(params)
    self.class.new(to_params.merge(params))
  end

  def to_params
    main_params
  end

  alias to_hash to_params

  private

  def main_params
    instance_values.symbolize_keys
  end
end
