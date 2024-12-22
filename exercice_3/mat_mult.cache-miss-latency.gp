# Calibrator v0.9e
# (by Stefan.Manegold@cwi.nl, http://www.cwi.nl/~manegold/)
 set term postscript portrait enhanced
 set output './mat_mult.cache-miss-latency.ps'
#set term gif transparent interlace small size 500, 707 # xFFFFFF x333333 x333333 x0055FF x005522 x660000 xFF0000 x00FF00 x0000FF
#set output './mat_mult.cache-miss-latency.gif'
set data style linespoints
set key below
set title './mat_mult.cache-miss-latency'
set xlabel 'memory range [bytes]'
set x2label ''
set ylabel 'nanosecs per iteration'
set y2label 'cycles per iteration'
set logscale x 2
set logscale x2 2
set logscale y 10
set logscale y2 10
set format x '%1.0f'
set format x2 '%1.0f'
set format y '%1.0f'
set format y2 ''
set xrange[0.750000:1310720.000000]
#set x2range[0.750000:1310720.000000]
set yrange[1.000000:1000.000000]
#set y2range[1.000000:1000.000000]
set grid x2tics
set xtics mirror ('1k' 1, '' 2, '4k' 4, '' 8, '16k' 16, '' 32, '64k' 64, '' 128, '256k' 256, '' 512, '1M' 1024, '' 2048, '4M' 4096, '' 8192, '16M' 16384, '' 32768, '64M' 65536, '' 131072, '256M' 262144, '' 524288, '1G' 1048576)
set x2tics mirror)
set y2tics ('(0)' 3.060000, '0.002' 1, '0.02' 10, '0.2' 100, '2' 1000)
set label 1 '(0)  ' at 0.750000,0.000000 right
set arrow 1 from 0.750000,0.000000 to 1310720.000000,0.000000 nohead lt 0
 set label 2 '^{ Calibrator v0.9e (Stefan.Manegold\@cwi.nl, www.cwi.nl/~manegold) }' at graph 0.5,graph 0.02 center
#set label 2    'Calibrator v0.9e (Stefan.Manegold@cwi.nl, www.cwi.nl/~manegold)'    at graph 0.5,graph 0.03 center
plot \
0.1 title 'stride:' with points pt 0 ps 0 , \
'./mat_mult.cache-miss-latency.data' using 1:($7-58.220000) title '16' with linespoints lt 1 pt 3 , \
'./mat_mult.cache-miss-latency.data' using 1:($13-58.220000) title '8' with linespoints lt 2 pt 4
set nolabel
set noarrow
