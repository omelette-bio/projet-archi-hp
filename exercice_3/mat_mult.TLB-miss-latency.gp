# Calibrator v0.9e
# (by Stefan.Manegold@cwi.nl, http://www.cwi.nl/~manegold/)
 set term postscript portrait enhanced
 set output './mat_mult.TLB-miss-latency.ps'
#set term gif transparent interlace small size 500, 707 # xFFFFFF x333333 x333333 x0055FF x005522 x660000 xFF0000 x00FF00 x0000FF
#set output './mat_mult.TLB-miss-latency.gif'
set data style linespoints
set key below
set title './mat_mult.TLB-miss-latency'
set xlabel 'spots accessed'
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
set xrange[3.000000:131072.000000]
#set x2range[3.000000:131072.000000]
set yrange[1.000000:1000.000000]
#set y2range[1.000000:1000.000000]
set grid x2tics
set xtics mirror ('1' 1, '2' 2, '4' 4, '8' 8, '16' 16, '32' 32, '64' 64, '128' 128, '256' 256, '512' 512, '1k' 1024, '2k' 2048, '4k' 4096, '8k' 8192, '16k' 16384, '32k' 32768, '64k' 65536, '128k' 131072)
set x2tics mirror ('<L1>' 1024)
set y2tics ('(0)' 7.480000, '0.002' 1, '0.02' 10, '0.2' 100, '2' 1000)
set label 1 '(0)  ' at 3.000000,0.000000 right
set arrow 1 from 3.000000,0.000000 to 131072.000000,0.000000 nohead lt 0
 set label 2 '^{ Calibrator v0.9e (Stefan.Manegold\@cwi.nl, www.cwi.nl/~manegold) }' at graph 0.5,graph 0.02 center
#set label 2    'Calibrator v0.9e (Stefan.Manegold@cwi.nl, www.cwi.nl/~manegold)'    at graph 0.5,graph 0.03 center
plot \
0.1 title 'stride:' with points pt 0 ps 0 , \
'./mat_mult.TLB-miss-latency.data' using 1:($7-0.000000) title '8200' with linespoints lt 2 pt 4 , \
'./mat_mult.TLB-miss-latency.data' using 1:($13-0.000000) title '4104' with linespoints lt 3 pt 5 , \
'./mat_mult.TLB-miss-latency.data' using 1:($19-0.000000) title '2056' with linespoints lt 4 pt 6 , \
'./mat_mult.TLB-miss-latency.data' using 1:($25-0.000000) title '1032' with linespoints lt 5 pt 7
set nolabel
set noarrow