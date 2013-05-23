set terminal pngcairo
set output 'bsplines.png'

#attractive gnuplotting
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 2 # --- red
set style line 2 lc rgb '#5e9c36' pt 6 ps 1 lt 1 lw 2 # --- green

set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror

set style line 12 lc rgb '#808080' lt 0
set grid back ls 12

#set title "FTP throughput"
set xlabel "x"
set ylabel "f(x)"
set key off
plot "bsplines.dat" using 1:2 with lines ls 1, \
"bsplines.dat" using 1:3 with lines ls 2, \
"bsplines.dat" using 1:4 with lines ls 1, \
"bsplines.dat" using 1:5 with lines ls 2, \
"bsplines.dat" using 1:6 with lines ls 1, \
"bsplines.dat" using 1:7 with lines ls 2, \
"bsplines.dat" using 1:8 with lines ls 1, \
"bsplines.dat" using 1:9 with lines ls 2
