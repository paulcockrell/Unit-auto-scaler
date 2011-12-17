#! /usr/bin/env ruby

require 'rubygems'
require 'pp'
require 'unit_auto_scaler'

UnitAutoScaler::Unit.add_unit :paul, :data, 1*6
UnitAutoScaler::Unit.add_alias :paul, :pauls, true, false
UnitAutoScaler::Unit.add_alias :paul, :p, false, true

scaled_value = 1500.bits.autoscale(:size=>3, :precision=>3, :shorthand=>false)
puts scaled_value.join(' ')
scaled_value = 2500.bytes.autoscale(:size=>2, :precision=>5, :shorthand=>false)
puts scaled_value.join(' ')
scaled_value = 134209.bits.autoscale(:size=>3, :precision=>2, :shorthand=>false)
puts scaled_value.join(' ')
scaled_value = 134209.kilobytes.autoscale(:size=>3, :precision=>5, :shorthand=>false)
puts scaled_value.join(' ')
scaled_value = 1500.kilobytes.autoscale(:size=>3, :precision=>5, :shorthand=>true)
puts scaled_value.join(' ')
scaled_value = 1000.bytes.autoscale(:size=>2, :precision=>2, :shorthand=>true)
puts scaled_value.join(' ')
scaled_value = 0.bits.autoscale
puts scaled_value.join(' ')
