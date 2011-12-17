Gem::Specification.new do |s|
  s.name = %q{unit_auto_scaler}
  s.version = "0.0.0"
  s.date = %q{2011-12-15}
  s.authors = [
    "Paul Cockrell"
  ]
  s.summary = %q{unit_auto_scaler takes a numeric value, on which you declare its units, and it scales it to a new value of a user defined length, and sets its new units of measurment appropriately}
  s.files = [
    "lib/unit_auto_scaler.rb",
    "lib/unit_auto_scaler/base.rb",
    "lib/unit_auto_scaler/unit.rb",
    "lib/unit_auto_scaler/units.rb"
  ]
  s.require_paths = ["lib"]
end
