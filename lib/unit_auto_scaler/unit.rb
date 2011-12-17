class UnitAutoScaler
  class Unit

    attr_reader :name, :unit_of, :value
    attr_accessor :plural, :shorthand

    @@units = {}
    
    def initialize(opts)
      @name     = opts[:name]
      @unit_of  = opts[:unit_of]
      @value    = opts[:value]
      @plural   = opts[:plural] || false
      @shorthand = opts[:shorthand] || false

      if @unit_of.nil?
        raise ArgumentError, "Adding unit with no unit type (#{name} - #{unit_of})"
      end
      unless opts[:name] || !@unit_of.is_base?
        raise ArgumentError, "Single-order units must be uniquely named (#{name} - #{unit_of})"
      end
      self.class.add_alias(self, @name.to_sym, false, false)
      raise ArgumentError, "Creating new unit with no value" unless @value
    end

    # create unit and store in class instance val
    def self.add_unit(name, unit_of, value)
      new_unit = Unit.new({ :name => name, :unit_of => unit_of, :value => value })
    end

    # add key for all alias names to point to 
    # same unit
    def self.add_alias(unit, name, plural, shorthand)
      unit = Unit.for(unit) unless unit.is_a? Unit
      tmp_unit = unit.dup
      tmp_unit.plural = plural || false
      tmp_unit.shorthand = shorthand || false
      @@units[name] = tmp_unit
    end

    # is self of class unit
    # returns true/false
    def self.is_unit?(to)
      to.is_a?(Unit) || @@units.has_key?(to)
    end

    # returns Unit object
    def self.for(to)
      if to.is_a?(Unit)
        to
      elsif to.is_a?(String)
        @@units[to.to_sym]
      else
        @@units[to]
      end
    end

    # Can this unit be converted into the target unit?
    # @param [Symbol String Unit]
    # @return [Boolean]
    def can_convert_to?(to = nil)
      if to.nil?
        units = @@units.select {|k,v| v.unit_of == @unit_of}
      else
        Unit.for(to).unit_of == @unit_of
      end
    end
  end
end
