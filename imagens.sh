#!/bin/bash
# Barbara Celi Braga Camargo - 2020 - bcbc.fisica@gmail.com
#programa para salvar e converter imagens mencoder para o Fargnulplot2D1D

mkdir imagens
for ((i=0; $i<=50000;i++))
  do
   if test $i -lt 10
  then
  ./fargnuplot2D1D -c -title=B204-0000$i -num=$i -s -r=0.0:1000  -png gamma-ceph.par #Para chamar o fargnuplot com as configurações que preciso
 cd out/ 
mv gasdens$i.png /home/pgf-sala-18/Desktop/form_binaria/bina2/b1/imagens/gasdens0000$i.png
cd ../    
elif test $i -lt 100
   then
 ./fargnuplot2D1D -c -title=B204-000$i -num=$i -s -r=0.0:1000 -png  gamma-ceph.par
cd out/ 
mv gasdens$i.png /home/pgf-sala-18/Desktop/form_binaria/bina2/b1/imagens/gasdens000$i.png
cd ../   
elif test $i -lt 1000
   then
 ./fargnuplot2D1D -c -title=B204-00$i -num=$i -s -r=0.0:1000 -png gamma-ceph.par
cd out/ 
mv gasdens$i.png /home/pgf-sala-18/Desktop/form_binaria/bina2/b1/imagens/gasdens00$i.png
cd ../ 
elif test $i -lt 10000
   then
 ./fargnuplot2D1D -c -title=B204-0$i -num=$i -s -r=0.0:1000  -png  gamma-ceph.par
cd out/ 
mv gasdens$i.png /home/pgf-sala-18/Desktop/form_binaria/bina2/b1/imagens/gasdens0$i.png
cd ../ 
elif test $i -lt 100000
   then
 ./fargnuplot2D1D -c -title=B204-$i -num=$i -s -r=0.0:1000  -png  gamma-ceph.par
cd out/ 
mv gasdens$i.png /home/pgf-sala-18/Desktop/form_binaria/bina2/b1/imagens/gasdens$i.png
cd ../ 
else
 ./fargnuplot2D1D -c -title=B204-$i -num=$i -s -r=0.0:1000 -palette="grayscale" -png  gamma-ceph.par
cd out/ 
mv gasdens$i.png /home/pgf-sala-18/Desktop/form_binaria/bina2/b1/imagens/gasdens$i.png
cd ../    
fi
   done
cd imagens/
mencoder mf://*.png -mf w=860:h=640:fps=10:type=png -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o binario.avi  #Para transformar em filme
