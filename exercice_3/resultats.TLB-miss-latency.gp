# Calibrator v0.9e
# (by Stefan.Manegold@cwi.nl, http://www.cwi.nl/~manegold/)
 set term postscript portrait enhanced
 set output 'resultats.TLB-miss-latency.ps'
#set term gif transparent interlace small size 500, 707 # xFFFFFF x333333 x333333 x0055FF x005522 x660000 xFF0000 x00FF00 x0000FF
#set output 'resultats.TLB-miss-latency.gif'
set data style linespoints
set key below
set title 'resultats.TLB-miss-latency'
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
set xrange[3.000000:32768.000000]
#set x2range[3.000000:32768.000000]
set yrange[1.000000:1000.000000]
#set y2range[1.000000:1000.000000]
set grid x2tics
set xtics mirror ('1' 1, '2' 2, '4' 4, '8' 8, '16' 16, '32' 32, '64' 64, '128' 128, '256' 256, '512' 512, '1k' 1024, '2k' 2048, '4k' 4096, '8k' 8192, '16k' 16384, '32k' 32768)
set x2tics mirror ('[64]' 64, '<L1>' 192)
set y2tics ('(4)' 1.210000, '(17)' 5.010000, '3.3' 1, '33' 10, '330' 100, '3.3e+03' 1000)
set label 1 '(1.21)  ' at 3.000000,1.212121 right
set arrow 1 from 3.000000,1.212121 to 32768.000000,1.212121 nohead lt 0
set label 2 '(5.15)  ' at 3.000000,5.151515 right
set arrow 2 from 3.000000,5.151515 to 32768.000000,5.151515 nohead lt 0
 set label 3 '^{ Calibrator v0.9e (Stefan.Manegold\@cwi.nl, www.cwi.nl/~manegold) }' at graph 0.5,graph 0.02 center
#set label 3    'Calibrator v0.9e (Stefan.Manegold@cwi.nl, www.cwi.nl/~manegold)'    at graph 0.5,graph 0.03 center
plot \
0.1 title 'stride:' with points pt 0 ps 0 , \
'resultats.TLB-miss-latency.data' using 1:($7-0.000000) title '8704' with linespoints lt 2 pt 4 , \
'resultats.TLB-miss-latency.data' using 1:($13-0.000000) title '\{4608\}' with linespoints lt 3 pt 5 , \
'resultats.TLB-miss-latency.data' using 1:($19-0.000000) title '2560' with linespoints lt 4 pt 6 , \
'resultats.TLB-miss-latency.data' using 1:($25-0.000000) title '1536' with linespoints lt 5 pt 7
set nolabel
set noarrow
