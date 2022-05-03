from rocrate.rocrate import ROCrate
from rocrate.model.person import Person
from rocrate.model.file import File 
from rocrate.model.dataset import Dataset 

import time
import sys
import os
import shutil

def main(argv):
    num_crates = argv[0]
    times = argv[1]
    start = time.time()
    for j in range(int(num_crates)):
        crate = ROCrate()
        for i in range(int(times)):
            person = Person(crate, 'id'+str(i), {'name': 'Joe Bloggs'})
            file = crate.add_file('./data/file'+str(i), 'file'+str(i), fetch_remote = True)
            file['author'] = person
            crate.add(file)
            crate.add(person)
        crate.write('crate' + str(j))
        parsed_crate = ROCrate('crate' + str(j));
    end = time.time();
    print(num_crates + " " + str(end-start))
    with open('mul_mix_py.txt', 'a') as the_file:
        the_file.write(str(end-start)+'\n')
    for j in range(int(num_crates)):
            shutil.rmtree('crate' + str(j));

if __name__ == "__main__":
   main(sys.argv[1:])



