require 'ro_crate'


times_to_add = ARGV[0]
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

crate = ROCrate::Crate.new

for i in 1..times_to_add.to_i do
  ext_file = crate.add_external_file('https://www.example.com/'+i.to_s)
end

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts(times_to_add + ' ' + (ending - starting).to_s)

File.open("data_remote_rb.txt", "a") { |f| f.puts(ending - starting).to_s}

#ROCrate::Writer.new(crate).write('./an_ro_crate_directory')

