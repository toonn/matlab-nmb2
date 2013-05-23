set terminal pngcairo
set output 'spline_periodic_ends.png'

#attractive gnuplotting
set style line 1 lc rgb '#8b1a0e' pt 1 ps 1 lt 1 lw 2 # --- red
set style line 2 lc rgb '#5e9c36' pt 6 ps 1 lt 1 lw 2 # --- green

set style line 11 lc rgb '#808080' lt 1
set border 2 back ls 11
set tics nomirror

set style line 12 lc rgb '#808080' lt 0
set grid back ls 12

set xlabel "x"
set ylabel "f(x)"
set xrange [ 0:6.2308 ]
set xzeroaxis
set xtics axis
set yrange [-1:1.5]
plot "spline_periodic.dat" using 1:(0*$1) title '' with lines ls 11, \
"spline_periodic.dat" using 1:2 title 'sin(3x)*cos(9x)' with lines \
lc rgb '#000000' lt 1 lw 2, \
"spline_periodic.dat" using 1:4 title 'kkb met bsplines' \
with points ls 1, \
"spline_periodic_knopen.dat" using 2:(0*$1) title 'knooppunten aan uiteinden interval' with points ls 2
