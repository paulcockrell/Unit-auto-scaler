require 'unit_auto_scaler/base'
require 'unit_auto_scaler/unit'
require 'unit_auto_scaler/units'

class Numeric

  alias_method :quantity_method_missing, :method_missing
  def method_missing(method, *args, &block)
    if UnitAutoScaler::Unit.is_unit?(method)
      UnitAutoScaler.new(self, method, args)
    else
      quantity_method_missing(method,*args, &block)
    end
  end

end
