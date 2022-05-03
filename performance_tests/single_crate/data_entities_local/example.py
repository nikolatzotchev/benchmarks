from rocrate.rocrate import ROCrate
from rocrate.model.person import Person
from rocrate.model.file import File 
from rocrate.model.dataset import Dataset 

import time
import sys

def main(argv):
    times = argv[0]
    start = time.time()
    crate = ROCrate()
    for i in range(int(times)):
        crate.add_file('./data/file'+str(i), 'file'+str(i), fetch_remote = True)
    
    end = time.time();
    print(times + " " + str(end-start))
    with open('data_local_py.txt', 'a') as the_file:
        the_file.write(str(end-start)+'\n')


if __name__ == "__main__":
   main(sys.argv[1:])


