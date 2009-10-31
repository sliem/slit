#!/bin/sh

if [ $# -lt 1 ]; then
 echo "Usage: slit [root piece]" 1>& 2;
 exit 1
fi

awk -v rootname="$1" '
/BEGIN PIECE/ {

 n = $3
 for(i = 4; i <= NF; i++)
     n = n " " $i
 

 pieces[n] = ""
 
 getline
 while($0 != "END PIECE") {
     pieces[n] = pieces[n] $0 "\n"
     getline
 }
 

}


END {

 root = pieces[rootname]

 while(match(root, "[[:blank:]]*INCLUDE PIECE [[:print:]]*") != 0) {
     s = substr(root, RSTART, RLENGTH)
     split(s, a, "INCLUDE PIECE ")
     if(a[2] in pieces) {
         p = pieces[a[2]]
         gsub("\n", "\n" a[1], p)
         sub("INCLUDE PIECE " a[2], p, root)
     } else
         sub("INCLUDE PIECE " a[2], "", root)
 }
 

 print root
}

'

