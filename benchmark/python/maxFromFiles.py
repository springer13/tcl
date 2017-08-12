import sys
from shutil import copyfile
import os.path

print "usage: <old> <new> <cols,...>"

f1Name = sys.argv[1]
f2Name = sys.argv[2]
columns = map(int,sys.argv[3].split(","))

if( not os.path.isfile(f1Name) ):
   exit(0)
if( not os.path.isfile(f2Name) ):
   copyfile(f1Name, f2Name)
   exit(0)

f1 = open(f1Name)
f2 = open(f2Name)

f1Content = []
for l in f1:
   f1Content.append(l)
f2Content = []
for l in f2:
   f2Content.append(l)

f1.close()
f2.close()
#os.remove(f1Name)

#create new file
f2 = open(f2Name,"w")
for i in range(len(f1Content)):
   try:
     newStr = ""
     tokens1 = f1Content[i].split()
     tokens2 = f2Content[i].split()
     for j in range(len(tokens1)):
        if( j in columns and float(tokens1[j]) > float(tokens2[j]) ):
            newStr += tokens1[j] + " "
        else:
            newStr += tokens2[j] + " "
     f2.write(newStr + "\n")
   except:
     print "ERROR:", i
f2.close()
