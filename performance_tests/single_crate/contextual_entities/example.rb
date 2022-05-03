require 'ro_crate'


times_to_add = ARGV[0]
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

crate = ROCrate::Crate.new
for i in 1..times_to_add.to_i do
  # Add an external file
  person = ROCrate::Person.new(crate, '#joe'+i.to_s, {name: 'Joe Bloggs'})
  crate.add_contextual_entity(person)
end

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

# write the result to a file
puts(times_to_add + ' ' + (ending - starting).to_s)
File.open("contextual_rb.txt", "a") { |f| f.puts(ending - starting).to_s}

#ROCrate::Writer.new(crate).write('./an_ro_crate_directory')

