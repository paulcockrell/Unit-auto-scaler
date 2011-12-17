class UnitAutoScaler
  class Unit

    # add_unit  <name (singular)>, <type>, <value>
    # add_alias <unit>, <name>, <plural>, <shorthand>

    # data unit defenitions
    add_unit  :bit, :data, 1
    add_alias :bit, :bits, true, false

    add_unit  :byte, :data, 8
    add_alias :byte, :bytes, true, false

    add_unit  :kilobyte, :data, 8 * 1000
    add_alias :kilobyte, :kilobytes, true, false
    add_alias :kilobyte, :kB, false, true

    add_unit  :megabyte, :data, 8 * (1000 ** 2)
    add_alias :megabyte, :megabytes, true, false
    add_alias :megabyte, :MB, false, true

    # power unit defenitions
    add_unit  :watt, :power, 1
    add_alias :watt, :watts, true, false
    add_alias :watt, :W, false, true

    add_unit  :kilowatt, :power, 1000
    add_alias :kilowatt, :kilowatts, true, false
    add_alias :kilowatt, :kW, false, true

    add_unit  :megawatt, :power, 1000 ** 2
    add_alias :megawatt, :megawatts, true, false
    add_alias :megawatt, :mW, false, true

  end
end
