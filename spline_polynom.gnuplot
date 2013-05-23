set terminal pngcairo
set output 'spline_polynom.png'

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
#set xrange [ 0:6.2308 ]
set xrange [1:5]
set xzeroaxis
set xtics axis
plot "polynom.dat" using 1:2 \
title 'x^4 - 2.4*x^3 - 38.91*x^2 + 165.67*x - 157.92' with lines ls 1, \
"spline_polynom.dat" using 1:2 title 'kkb met bsplines' with points ls 2, \
"polynom.dat" using 1:(0*$1) title '' with lines ls 11
