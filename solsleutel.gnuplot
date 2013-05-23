set terminal pngcairo
set output 'solsleutel.png'

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
set xrange [ 0.2:0.7 ]
#set xzeroaxis
#set xtics axis
#set yrange [-2:2]
plot "solsleutel.dat" using 1:2 title 'click' with points ls 1, \
"solsleutel_spline.dat" using 1:2 title 'kkb met bsplines' with lines ls 2
