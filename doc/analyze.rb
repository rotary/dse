#!/usr/bin/env ruby
require 'fileutils'
require 'active_support/all'

source = nil
File.open("test.txt", "rb") do |f|
  source = f.read
end

fields = source.split(/\s*\-\-\-\s*/)[1..-1].collect do |infos|
  x = infos.split(/\s*\n\s*/).inject({}) do |hash, line|
    array = line.split(/\:\ +/)
    info = array[0][5..-1].underscore.to_sym
    value = array[1]
    unless [:value, :justification].include?(info) or value.blank?
      if [:name, :type].include?(info)
        hash[info] = value.gsub(/[\ \.]/, '_').underscore.to_sym
      elsif [:flags].include?(info)
        hash[info] = value.to_i if value.to_i > 0
      elsif [:state_option].include?(info)
        hash[info] ||= []
        hash[info] << value
      else
        hash[info] = value
      end
    end
    hash
  end
  x
end
fields = fields.select{|f| !f[:type].nil?}
# puts fields.inspect
names = fields.collect{|f| f[:name]}
#puts names.size
#puts names.uniq.size
puts fields.inspect
#puts fields.select{|f| f[:name].to_s.match(/(date|dob)/)}
#puts fields.size
# fields.each do |f|
#   puts "      t.text :#{f[:name]}"
# end
