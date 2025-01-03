# Calibrator v0.9e
# (by Stefan.Manegold@cwi.nl, http://www.cwi.nl/~manegold/)
# set term postscript portrait enhanced
# set output 'resultats.cache-miss-latency.ps'
set term gif background "white" interlace small size 800, 700
set output 'resultats.cache-miss-latency.gif'
#set data style linespoints
set key below
set title 'resultats.cache-miss-latency'
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
set xrange[1.000000:327680.000000]
#set x2range[1.000000:327680.000000]
set yrange[1.000000:100.000000]
#set y2range[1.000000:1000.000000]
set grid x2tics
set xtics mirror ('1k' 1, '' 2, '4k' 4, '' 8, '16k' 16, '' 32, '64k' 64, '' 128, '256k' 256, '' 512, '1M' 1024, '' 2048, '4M' 4096, '' 8192, '16M' 16384, '' 32768, '64M' 65536, '' 131072, '256M' 262144)
set x2tics mirror ('[96k]' 96, '[1M]' 1280, '[12M]' 12288)
set y2tics ('(4)' 1.190000, '(4)' 1.290000, '(5)' 1.530000, '(116)' 35.300000, '3.3' 1, '33' 10, '330' 100, '3.3e+03' 1000)
set label 1 '(1.21)  ' at 1.000000,1.212121 right
set arrow 1 from 1.000000,1.212121 to 327680.000000,1.212121 nohead lt 0
set label 2 '(1.21)  ' at 1.000000,1.212121 right
set arrow 2 from 1.000000,1.212121 to 327680.000000,1.212121 nohead lt 0
set label 3 '(1.52)  ' at 1.000000,1.515152 right
set arrow 3 from 1.000000,1.515152 to 327680.000000,1.515152 nohead lt 0
set label 4 '(35.2)  ' at 1.000000,35.151516 right
set arrow 4 from 1.000000,35.151516 to 327680.000000,35.151516 nohead lt 0
 set label 5 '^{ Calibrator v0.9e (Stefan.Manegold\@cwi.nl, www.cwi.nl/~manegold) }' at graph 0.5,graph 0.02 center
#set label 5    'Calibrator v0.9e (Stefan.Manegold@cwi.nl, www.cwi.nl/~manegold)'    at graph 0.5,graph 0.03 center
plot \
0.1 title 'stride:' with points pt 0 ps 0 , \
'resultats.cache-miss-latency.data' using 1:($7-23.890000) title '1024' with linespoints lt 1 pt 3 , \
'resultats.cache-miss-latency.data' using 1:($13-23.890000) title '\{512\}' with linespoints lt 2 pt 4 , \
'resultats.cache-miss-latency.data' using 1:($19-23.890000) title '256' with linespoints lt 3 pt 5 , \
'resultats.cache-miss-latency.data' using 1:($25-23.890000) title '128' with linespoints lt 4 pt 6 , \
'resultats.cache-miss-latency.data' using 1:($31-23.890000) title '64' with linespoints lt 5 pt 7 , \
'resultats.cache-miss-latency.data' using 1:($37-23.890000) title '32' with linespoints lt 6 pt 8 , \
'resultats.cache-miss-latency.data' using 1:($43-23.890000) title '16' with linespoints lt 7 pt 9 , \
'resultats.cache-miss-latency.data' using 1:($49-23.890000) title '8' with linespoints lt 8 pt 10
set nolabel
set noarrow
