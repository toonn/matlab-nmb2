set terminal pngcairo
set output 'oneindig.png'

#attractive gnuplotting
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 2 # --- red
set style line 2 lc rgb '#5e9c36' pt 6 ps 1 lt 1 lw 2 # --- green

set style line 11 lc rgb '#808080' lt 1
set border 2 back ls 11
set tics nomirror

set style line 12 lc rgb '#808080' lt 0
set grid back ls 12

set xlabel "x"
set ylabel "y"
#set xrange [ 0:6.2308 ]
#set xzeroaxis
#set xtics axis
#set yrange [-2:2]
plot "oneindig.dat" using 1:2 title 'click' with linespoints ls 1, \
"oneindig_periotrig.dat" using 1:2 title 'periodieke benadering' with lines ls 2
