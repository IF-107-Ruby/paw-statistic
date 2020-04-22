class BaseModelStruct
  def as_json
    super.deep_symbolize_keys
  end

  def with_params(params)
    as_json.merge(params)
  end
end
