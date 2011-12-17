class UnitAutoScaler
  autoload :Unit, 'unit_auto_scaler/unit'
  attr_reader :name, :unit, :value

  def initialize(value, unit = nil, args = nil )
    case value
      when Hash
        @unit = Unit.for(value[:unit])
        @reference_value = value[:reference_value].to_f || (value[:value] * @unit.value).to_f
        @value = @unit.value_for(@reference_value)
      when Numeric
        @unit = Unit.for(unit)
        if @unit.nil?
          @unit = Unit.from_string_form(unit)
        end
        @reference_value = value.to_f * @unit.value 
        @value = value
    end
  end

  def measures
    @unit.unit_of
  end

  def can_convert_to?(unit=nil)
    @unit.can_convert_to?(unit)
  end

  def autoscale(opts={})
    size      = opts[:size] || 5
    precision = opts[:precision] || 2
    shorthand = opts[:shorthand] || false
    relative_units = self.can_convert_to?

    matches = Array.new
    relative_units.each do |relative_unit|
      unit = relative_unit[1]
      conversion = @reference_value / unit.value
      next if (((conversion == 1) == unit.plural) && unit.shorthand == false) ||
              !matches.select {|m| m[1].name==unit.name}.empty? ||
              unit.shorthand != shorthand
      # we only want the units whose result is less than or equal to 
      # the user defined integer count
      if conversion.truncate.to_s.length <= size
        matches << relative_unit
      end
    end

    if matches.empty?
      # failed to convert the value to a different unit 
      # so return original value and unit, we should
      # take a parameter called :fail_on_no_match that
      # alows us to decide if we return the original
      # value or show its failed to convert by returning
      # nil
      [@reference_value, @unit]
    else
      # successfully converted to a new unit, get
      # conversion closest to original unit and
      # return value and unit
      matches = matches.sort_by {|unit| unit[1].value}
      conversion = matches.first
      conversion_name = conversion[0]
      conversion_value = ("%.#{precision}f" % (@reference_value / conversion[1].value)).to_f
      [conversion_value, conversion_name]
    end
  end

end
