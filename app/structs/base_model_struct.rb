class BaseModelStruct
  def with_params(params)
    self.class.new(to_params.merge(params))
  end
end
