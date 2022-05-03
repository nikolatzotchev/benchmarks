import os
os.mkdir('data')
for i in range(10000):
    f = open('./data/file' + str(i), 'w')
    f.write('One sentence!')
    f.close
