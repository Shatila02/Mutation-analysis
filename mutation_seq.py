import os
import csv
os.chdir("F:\\Genes\\mutation_seq")
print("{0}".format(os.getcwd()))
membrane = open("membrane.csv", "r")
seq = open("M.txt", "r")
reader = csv.reader(membrane)
next(reader)
seq_reader = seq.read()
mutation = []
mutation1 = []
f = []
l = []
positions = []
mutate = []
[mutation.append(r[1:2]) for r in reader]
mutation = [m for sublist in mutation for m in sublist]
mutation = [m.strip() for m in mutation]
for i in mutation:
    s = len(i)-1
    f.append(i[0])
    l.append(i[s:])
    positions.append(int(i[1:s])-1)
wild = list(seq_reader)
loop = len(f)
for j in range(loop):
    w = wild[:]
    if w[positions[j]] == f[j]:
        w[positions[j]] = l[j]
        mutate = "".join(w)
        name = mutation[j]
        seq = open("%s.txt" %name, "w")
        seq.write(mutate)
        seq.close()

