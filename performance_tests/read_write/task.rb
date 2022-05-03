require 'ro_crate'

num_crates = ARGV[0]
entities_in_crate = ARGV[1]
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
for j in 1..num_crates.to_i do
  crate = ROCrate::Crate.new
  for i in 1..entities_in_crate.to_i do
    local_file = crate.add_file('./data/file'+i.to_s)
    person = ROCrate::Person.new(crate, '#joe'+i.to_s, {name: 'Joe Bloggs'})
    crate.add_contextual_entity(person)
    local_file.author = person
  end
  ROCrate::Writer.new(crate).write('crate'+j.to_s)
  parsed_crate = ROCrate::Reader.read('crate'+j.to_s)
end

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

for j in 1..num_crates.to_i do
  FileUtils.remove_dir('crate'+j.to_s)
end

puts("crates = " + num_crates + ' ' + "entities in crate = " + entities_in_crate + " time = "+ (ending - starting).to_s)
File.open("mul_mix_rb.txt", "a") { |f| f.puts(ending - starting).to_s}

#ROCrate::Writer.new(crate).write('./an_ro_crate_directory')


