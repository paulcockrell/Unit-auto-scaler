# Unit auto scaler Ruby gem

unit_auto_scaler takes a numeric value, on which you declare its units, and it scales it to a new value of a user defined length, and sets its new units of measurment appropriately.

Example:
We have a number of an unknown size. The number is a value measured in Watts. We have a known limited amount of space in which we can display this value, lets say 6 characters long (3 whole numbers, a decimal point and 2 decimal places).

```ruby
        irb> 55678934.watts.autoscale :size=>3, :precision=>2
        irb> [55.68, :megawatts] 
```
So now our number and its units are automatically scaled to the correct value and units based on the constraints placed upon it.

If we want the units in a shorthand version we pass the parameter ':shorthand=>true'

```ruby
        irb> 55678934.watts.autoscale :size=>3, :precision=>2, :shorthand=>true
        irb> [55.68, :MW]
```

The units that are predefined in this gem are very limited but we can add to this list quite easily.

Declaring a unit is a two step process. Where first we declare the base unit (the unit for the value of 1, so for power this is 'Watt' or data it would be 'Bit'). Then we declare the aliases, of which there can be as many as you want, but generally we find that we only need two: the plural versions of the unit declared (so the alias for 'Watt' is 'Watts'), and also the shorthand for the unit ('Watt' = 'W'). The following code snippet shows the declaration of a base unit 'Watt', and one of its multiples 'Kilowatt'. Note that the value assigned to the multiple is an equation of the relationship between itself and the base unit. This is how the new scaled numbers are calculated


Units are grouped together by having a common type, so for units such as watts, kilowatts they would have a common type declared as 'power', although this name can be what ever you please.
We can add new unit conversions by following the example below:

```ruby
   # add_unit  <name (singular)>, <type>, <value>
   # add_alias <unit>, <name>, <plural>, <shorthand>

   UnitAutoScaler::Unit.add_unit  :watt, :power, 1
   UnitAutoScaler::Unit.add_alias :watt, :watts, true, false
   UnitAutoScaler::Unit.add_alias :watt, :W, false, true

   UnitAutoScaler::Unit.add_unit  :kilowatt, :power, 1000
   UnitAutoScaler::Unit.add_alias :kilowatt, :kilowatts, true, false
   UnitAutoScaler::Unit.add_alias :kilowatt, :kW, false, true
```

If you want to add new units to the gem, then ammend the file <path to gem source>/lib/unit_auto_scaler/units.rb

## Requirements

* Ruby 1.8 >

## Installation

Install the gem
Change to the directory where you downloaded the gem source to and run the command:

        sudo gem install unit_auto_scaler-0.0.0.gem 

Test the gem
Change to the directory where you downloaded the gem source to and run the command:

        ./test.rb
