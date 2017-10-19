for i in `seq 1 2`;
do
  rm -f tmp2.dat tmp.dat
   echo nma-umn-au 12960 120 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n a,u n,m,a a:120,m:108,u:120,n:120 | grep GFLOPS >> tmp.dat
   echo anm-au-umn 120 11664 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u u,m,n a,n,m a:120,m:108,u:120,n:108 | grep GFLOPS >> tmp.dat
   echo man-mun-au 12960 120 108 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n a,u m,a,n a:120,u:108,m:120,n:108 | grep GFLOPS >> tmp.dat
   echo mna-mun-au 12960 120 108 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n a,u m,n,a a:120,u:108,m:120,n:108 | grep GFLOPS >> tmp.dat
   echo onam-uomn-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,m,n a,u o,n,a,m a:32,m:30,u:32,o:32,n:32 | grep GFLOPS >> tmp.dat
   echo nmao-uomn-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,m,n a,u n,m,a,o a:32,m:30,u:32,o:32,n:32 | grep GFLOPS >> tmp.dat
   echo mona-nomu-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,m,u a,u m,o,n,a a:32,u:32,m:32,o:30,n:32 | grep GFLOPS >> tmp.dat
   echo onam-nomu-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,m,u a,u o,n,a,m a:32,u:32,m:30,o:32,n:32 | grep GFLOPS >> tmp.dat
   echo nmpao-umnpo-ua 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,p,o u,a n,m,p,a,o a:16,m:15,o:16,n:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo maopn-umnpo-ua 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,p,o u,a m,a,o,p,n a:16,m:16,o:15,n:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo pnoma-opmun-ua 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,p,m,u,n u,a p,n,o,m,a a:16,m:15,o:16,n:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo apnmo-ua-opmun 24 65536 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a o,p,m,u,n a,p,n,m,o a:24,m:16,o:16,n:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo qpoman-pqmnou-ua 57600 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,q,m,n,o,u u,a q,p,o,m,a,n a:8,m:9,o:10,n:10,q:8,p:8,u:8 | grep GFLOPS >> tmp.dat
   echo nmaqpo-pqmnou-ua 57600 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,q,m,n,o,u u,a n,m,a,q,p,o a:8,m:9,o:10,n:8,q:10,p:8,u:8 | grep GFLOPS >> tmp.dat
   echo napqmo-opmuqn-ua 57600 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,p,m,u,q,n u,a n,a,p,q,m,o a:8,m:9,o:8,n:8,q:10,p:10,u:8 | grep GFLOPS >> tmp.dat
   echo omqpan-opmuqn-ua 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,p,m,u,q,n u,a o,m,q,p,a,n a:8,m:9,o:8,n:10,q:10,p:10,u:8 | grep GFLOPS >> tmp.dat
   echo abm-uba-um 12960 108 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a u,m a,b,m a:120,m:108,b:108,u:120 | grep GFLOPS >> tmp.dat
   echo mab-um-uba 120 11664 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m u,b,a m,a,b a:108,m:120,b:108,u:120 | grep GFLOPS >> tmp.dat
   echo bma-uba-mu 12960 120 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a m,u b,m,a a:108,m:120,b:120,u:120 | grep GFLOPS >> tmp.dat
   echo mab-mu-uba 120 11664 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u u,b,a m,a,b a:108,m:120,b:108,u:120 | grep GFLOPS >> tmp.dat
   echo nmba-mun-uab 768 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n u,a,b n,m,b,a a:32,u:1152,b:32,m:24,n:32 | grep GFLOPS >> tmp.dat
   echo anmb-uab-mun 960 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b m,u,n a,n,m,b a:32,u:1152,b:30,m:32,n:32 | grep GFLOPS >> tmp.dat
   echo banm-uab-num 960 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b n,u,m b,a,n,m a:30,u:1152,b:32,m:32,n:32 | grep GFLOPS >> tmp.dat
   echo manb-num-uab 768 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m u,a,b m,a,n,b a:32,u:1152,b:32,m:24,n:32 | grep GFLOPS >> tmp.dat
   echo am-vua-vmu 120 108 12960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a v,m,u a,m a:120,m:108,u:108,v:120 | grep GFLOPS >> tmp.dat
   echo ma-vmu-vua 120 108 12960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u v,u,a m,a a:108,u:108,m:120,v:120 | grep GFLOPS >> tmp.dat
   echo ma-umv-vua 120 108 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v v,u,a m,a a:108,m:120,u:120,v:120 | grep GFLOPS >> tmp.dat
   echo am-vua-umv 120 108 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a u,m,v a,m a:120,m:108,u:120,v:120 | grep GFLOPS >> tmp.dat
   echo aobmn-bau-uonm 384 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,u u,o,n,m a,o,b,m,n a:24,b:16,m:16,o:16,n:16,u:256 | grep GFLOPS >> tmp.dat
   echo bomna-bau-uonm 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,u u,o,n,m b,o,m,n,a a:15,b:16,m:16,o:16,n:16,u:256 | grep GFLOPS >> tmp.dat
   echo abomn-bau-ounm 384 4096 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,u o,u,n,m a,b,o,m,n a:24,b:16,m:16,o:16,n:16,u:270 | grep GFLOPS >> tmp.dat
   echo mnabo-ounm-bau 3840 256 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,n,m b,a,u m,n,a,b,o a:16,b:16,m:16,o:16,n:15,u:270 | grep GFLOPS >> tmp.dat
   echo nam-uvnm-avu 960 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,n,m a,v,u n,a,m a:1152,m:30,n:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo amn-avu-uvnm 1152 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u u,v,n,m a,m,n a:1152,m:32,n:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo nam-muvn-avu 768 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v,n a,v,u n,a,m a:1152,u:32,n:24,m:32,v:32 | grep GFLOPS >> tmp.dat
   echo amn-avu-muvn 1152 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u m,u,v,n a,m,n a:1152,u:32,n:32,m:32,v:32 | grep GFLOPS >> tmp.dat
   echo omnbpa-nopum-uab 5760 100 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,p,u,m u,a,b o,m,n,b,p,a a:10,b:10,m:9,o:8,n:8,p:10,u:96 | grep GFLOPS >> tmp.dat
   echo oapbmn-nopum-uab 5760 100 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,p,u,m u,a,b o,a,p,b,m,n a:10,b:10,m:9,o:8,n:8,p:10,u:96 | grep GFLOPS >> tmp.dat
   echo bnmapo-uab-numop 72 8000 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b n,u,m,o,p b,n,m,a,p,o a:9,b:8,m:10,o:10,n:8,p:10,u:96 | grep GFLOPS >> tmp.dat
   echo apbnom-uab-numop 72 8000 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b n,u,m,o,p a,p,b,n,o,m a:8,b:9,m:10,o:10,n:8,p:10,u:96 | grep GFLOPS >> tmp.dat
   echo amno-vau-oumvn 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u o,u,m,v,n a,m,n,o a:240,m:16,o:16,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo anom-vau-oumvn 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u o,u,m,v,n a,n,o,m a:240,m:16,o:16,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo amno-vau-ovunm 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u o,v,u,n,m a,m,n,o a:240,m:16,o:16,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo amon-vau-ovunm 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u o,v,u,n,m a,m,o,n a:240,m:16,o:16,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo amonp-vua-pvnuom 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a p,v,n,u,o,m a,m,o,n,p a:96,m:10,o:10,n:10,p:8,u:10,v:8 | grep GFLOPS >> tmp.dat
   echo apmon-vua-pvnuom 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a p,v,n,u,o,m a,p,m,o,n a:96,m:10,o:10,n:10,p:8,u:10,v:8 | grep GFLOPS >> tmp.dat
   echo ampno-vua-puvmon 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a p,u,v,m,o,n a,m,p,n,o a:96,m:10,o:10,n:10,p:8,u:10,v:8 | grep GFLOPS >> tmp.dat
   echo amnop-vua-puvmon 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a p,u,v,m,o,n a,m,n,o,p a:96,m:10,o:10,n:10,p:8,u:10,v:8 | grep GFLOPS >> tmp.dat
   echo cmab-bacu-um 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u u,m c,m,a,b a:30,m:32,c:32,b:32,u:32 | grep GFLOPS >> tmp.dat
   echo bcam-bacu-um 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u u,m b,c,a,m a:30,m:32,c:32,b:32,u:32 | grep GFLOPS >> tmp.dat
   echo camb-bacu-mu 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u m,u c,a,m,b a:30,m:32,c:32,b:32,u:32 | grep GFLOPS >> tmp.dat
   echo amcb-bacu-mu 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u m,u a,m,c,b a:32,m:32,c:30,b:32,u:32 | grep GFLOPS >> tmp.dat
   echo nacmb-unm-cbua 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m c,b,u,a n,a,c,m,b a:16,c:16,b:16,m:15,n:16,u:256 | grep GFLOPS >> tmp.dat
   echo mnbca-unm-cbua 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m c,b,u,a m,n,b,c,a a:16,c:16,b:16,m:16,n:15,u:256 | grep GFLOPS >> tmp.dat
   echo canbm-cbua-num 3840 256 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a n,u,m c,a,n,b,m a:15,c:16,b:16,m:16,n:16,u:270 | grep GFLOPS >> tmp.dat
   echo cmnba-cbua-num 3840 256 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a n,u,m c,m,n,b,a a:15,c:16,b:16,m:16,n:16,u:270 | grep GFLOPS >> tmp.dat
   echo mba-muv-abvu 1152 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v a,b,v,u m,b,a a:32,m:1152,b:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo bma-abvu-muv 768 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u m,u,v b,m,a a:24,m:1152,b:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo amb-abvu-umv 960 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u u,m,v a,m,b a:32,m:1152,b:30,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo bma-abvu-umv 768 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u u,m,v b,m,a a:24,m:1152,b:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo aombnc-ubac-nmou 720 800 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,c n,m,o,u a,o,m,b,n,c a:8,c:9,b:10,m:10,o:10,n:8,u:1000 | grep GFLOPS >> tmp.dat
   echo mncboa-nmou-ubac 576 1000 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,o,u u,b,a,c m,n,c,b,o,a a:10,c:10,b:10,m:8,o:9,n:8,u:1000 | grep GFLOPS >> tmp.dat
   echo oamnbc-unmo-ubac 720 1000 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,o u,b,a,c o,a,m,n,b,c a:10,c:10,b:10,m:9,o:8,n:10,u:1000 | grep GFLOPS >> tmp.dat
   echo oambnc-unmo-ubac 720 1000 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,o u,b,a,c o,a,m,b,n,c a:10,c:10,b:10,m:9,o:8,n:10,u:1000 | grep GFLOPS >> tmp.dat
   echo bnam-auvb-nvmu 768 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b n,v,m,u b,n,a,m a:24,b:32,m:32,n:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo nbma-nvmu-auvb 960 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,m,u a,u,v,b n,b,m,a a:32,b:32,m:30,n:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo amnb-auvb-mvun 960 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b m,v,u,n a,m,n,b a:32,b:30,m:32,n:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo bman-auvb-mvun 768 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b m,v,u,n b,m,a,n a:24,b:32,m:32,n:32,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo am-uavw-vmwu 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v,w v,m,w,u a,m a:24,m:32,u:32,w:32,v:32 | grep GFLOPS >> tmp.dat
   echo ma-vmwu-uavw 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,w,u u,a,v,w m,a a:32,u:32,m:24,w:32,v:32 | grep GFLOPS >> tmp.dat
   echo ma-mvuw-uavw 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,w u,a,v,w m,a a:32,u:32,m:24,w:32,v:32 | grep GFLOPS >> tmp.dat
   echo am-uavw-mvuw 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v,w m,v,u,w a,m a:24,m:32,u:32,w:32,v:32 | grep GFLOPS >> tmp.dat
   echo mabno-muvon-ubav 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v,o,n u,b,a,v m,a,b,n,o a:16,b:16,m:16,o:15,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo nmabo-muvon-ubav 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v,o,n u,b,a,v n,m,a,b,o a:16,b:16,m:16,o:15,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mbnao-vnoum-ubav 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,o,u,m u,b,a,v m,b,n,a,o a:16,b:16,m:16,o:15,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo bmaon-ubav-vnoum 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v v,n,o,u,m b,m,a,o,n a:15,b:16,m:16,o:16,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo anm-uwav-mnwvu 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,a,v m,n,w,v,u a,n,m a:240,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo amn-uwav-vwunm 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,a,v v,w,u,n,m a,m,n a:240,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo anm-uwav-mwvnu 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,a,v m,w,v,n,u a,n,m a:240,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo amn-uwav-mwvnu 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,a,v m,w,v,n,u a,m,n a:240,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo obpanm-nvupmo-aubv 5760 80 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,p,m,o a,u,b,v o,b,p,a,n,m a:8,b:10,m:9,o:8,n:8,p:10,u:10,v:10 | grep GFLOPS >> tmp.dat
   echo ampbon-aubv-nvupmo 72 8000 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v n,v,u,p,m,o a,m,p,b,o,n a:8,b:9,m:10,o:10,n:8,p:10,u:10,v:10 | grep GFLOPS >> tmp.dat
   echo noapmb-npomuv-aubv 7200 80 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,p,o,m,u,v a,u,b,v n,o,a,p,m,b a:8,b:10,m:9,o:10,n:8,p:10,u:10,v:10 | grep GFLOPS >> tmp.dat
   echo aonmbp-aubv-npomuv 72 8000 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v n,p,o,m,u,v a,o,n,m,b,p a:8,b:9,m:10,o:10,n:8,p:10,u:10,v:10 | grep GFLOPS >> tmp.dat
   echo nmao-nvuwom-vwua 720 972 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,w,o,m v,w,u,a n,m,a,o a:972,m:9,o:10,n:8,u:10,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo namo-nvuwom-vwua 720 972 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,w,o,m v,w,u,a n,a,m,o a:972,m:9,o:10,n:8,u:10,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo mano-uvmnwo-vwua 720 972 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m,n,w,o v,w,u,a m,a,n,o a:972,m:8,o:9,n:10,u:8,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo onam-uvmnwo-vwua 720 972 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m,n,w,o v,w,u,a o,n,a,m a:972,m:9,o:8,n:10,u:8,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo bdcma-udbca-mu 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,b,c,a m,u b,d,c,m,a a:15,c:16,b:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo cdamb-udbca-mu 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,b,c,a m,u c,d,a,m,b a:15,c:16,b:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo dmcba-udbca-um 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,b,c,a u,m d,m,c,b,a a:15,c:16,b:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo dcbma-udbca-um 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,b,c,a u,m d,c,b,m,a a:15,c:16,b:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo nacbmd-mnu-abudc 192 8000 90 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,b,u,d,c n,a,c,b,m,d a:8,c:10,b:10,d:10,m:24,n:8,u:90 | grep GFLOPS >> tmp.dat
   echo dbcanm-abudc-mnu 5760 80 90 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,d,c m,n,u d,b,c,a,n,m a:8,c:9,b:10,d:8,m:8,n:10,u:90 | grep GFLOPS >> tmp.dat
   echo mcdnba-umn-abudc 72 8000 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n a,b,u,d,c m,c,d,n,b,a a:8,c:10,b:10,d:10,m:8,n:9,u:96 | grep GFLOPS >> tmp.dat
   echo cdnmba-abudc-umn 5760 100 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,d,c u,m,n c,d,n,m,b,a a:8,c:8,b:9,d:10,m:10,n:10,u:96 | grep GFLOPS >> tmp.dat
   echo macb-uvm-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m a,b,v,c,u m,a,c,b a:16,c:16,b:16,m:240,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mbca-uvm-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m a,b,v,c,u m,b,c,a a:16,c:16,b:16,m:240,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mcba-umv-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v a,b,v,c,u m,c,b,a a:16,c:16,b:16,m:240,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mbca-umv-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v a,b,v,c,u m,b,c,a a:16,c:16,b:16,m:240,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mbnac-uvmn-avcub 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m,n a,v,c,u,b m,b,n,a,c a:16,c:16,b:16,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo cnmba-avcub-uvmn 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,c,u,b u,v,m,n c,n,m,b,a a:16,c:16,b:15,m:16,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo nambc-mnvu-avcub 384 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u a,v,c,u,b n,a,m,b,c a:16,c:16,b:16,m:24,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo macbn-mnvu-avcub 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u a,v,c,u,b m,a,c,b,n a:16,c:16,b:16,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mba-wuvm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,v,m w,v,a,u,b m,b,a a:16,b:16,m:240,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mab-wuvm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,v,m w,v,a,u,b m,a,b a:16,b:16,m:240,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mba-uvwm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,m w,v,a,u,b m,b,a a:16,b:16,m:240,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mab-uvwm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,m w,v,a,u,b m,a,b a:16,b:16,m:240,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo cmobna-bcvau-unvom 576 1000 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,a,u u,n,v,o,m c,m,o,b,n,a a:9,c:8,b:8,m:10,o:10,n:10,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo bmaocn-bcvau-unvom 720 1000 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,a,u u,n,v,o,m b,m,a,o,c,n a:9,c:10,b:8,m:10,o:10,n:10,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo mocbna-uvomn-bcvau 720 800 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,o,m,n b,c,v,a,u m,o,c,b,n,a a:10,c:10,b:8,m:8,o:9,n:10,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo ocanmb-uvomn-bcvau 720 800 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,o,m,n b,c,v,a,u o,c,a,n,m,b a:10,c:10,b:8,m:9,o:8,n:10,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo manb-vnwum-vuabw 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,w,u,m v,u,a,b,w m,a,n,b a:16,b:16,m:16,n:15,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo banm-vuabw-vnwum 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b,w v,n,w,u,m b,a,n,m a:15,b:16,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo ambn-vuabw-nwumv 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b,w n,w,u,m,v a,m,b,n a:16,b:15,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo anmb-vuabw-nwumv 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b,w n,w,u,m,v a,n,m,b a:16,b:15,m:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo bonma-auvwb-nuomwv 768 800 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b n,u,o,m,w,v b,o,n,m,a a:24,b:32,m:10,o:10,n:8,u:10,w:10,v:10 | grep GFLOPS >> tmp.dat
   echo obmna-nuomwv-auvwb 576 1024 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,o,m,w,v a,u,v,w,b o,b,m,n,a a:32,b:32,m:9,o:8,n:8,u:10,w:10,v:10 | grep GFLOPS >> tmp.dat
   echo boanm-auvwb-wumovn 768 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b w,u,m,o,v,n b,o,a,n,m a:24,b:32,m:10,o:10,n:10,u:10,w:8,v:10 | grep GFLOPS >> tmp.dat
   echo ambon-auvwb-wumovn 960 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b w,u,m,o,v,n a,m,b,o,n a:32,b:30,m:10,o:10,n:10,u:10,w:8,v:10 | grep GFLOPS >> tmp.dat
   echo acmbed-ucebad-mu 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,e,b,a,d m,u a,c,m,b,e,d a:8,c:9,b:10,e:10,d:10,m:8,u:8 | grep GFLOPS >> tmp.dat
   echo mdeabc-mu-ucebad 24 100000 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u u,c,e,b,a,d m,d,e,a,b,c a:10,c:10,b:10,e:10,d:10,m:24,u:8 | grep GFLOPS >> tmp.dat
   echo becdam-ucebad-um 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,e,b,a,d u,m b,e,c,d,a,m a:9,c:10,b:8,e:10,d:10,m:8,u:8 | grep GFLOPS >> tmp.dat
   echo abmcde-ucebad-um 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,e,b,a,d u,m a,b,m,c,d,e a:8,c:9,b:10,e:10,d:10,m:8,u:8 | grep GFLOPS >> tmp.dat
   echo cambd-adbuvc-mvu 5760 96 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,b,u,v,c m,v,u c,a,m,b,d a:8,c:8,b:9,d:10,m:96,u:10,v:10 | grep GFLOPS >> tmp.dat
   echo dacmb-adbuvc-mvu 5760 96 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,b,u,v,c m,v,u d,a,c,m,b a:8,c:9,b:10,d:8,m:96,u:10,v:10 | grep GFLOPS >> tmp.dat
   echo mbdca-vum-adbuvc 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m a,d,b,u,v,c m,b,d,c,a a:8,c:10,b:10,d:10,m:96,u:10,v:8 | grep GFLOPS >> tmp.dat
   echo mcabd-vum-adbuvc 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m a,d,b,u,v,c m,c,a,b,d a:8,c:10,b:10,d:10,m:96,u:10,v:8 | grep GFLOPS >> tmp.dat
   echo mbdcna-unvm-udavcb 72 10000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,v,m u,d,a,v,c,b m,b,d,c,n,a a:10,c:10,b:10,d:10,m:8,n:9,u:8,v:10 | grep GFLOPS >> tmp.dat
   echo bmacnd-udavcb-unvm 7200 100 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,a,v,c,b u,n,v,m b,m,a,c,n,d a:9,c:10,b:8,d:10,m:10,n:10,u:8,v:10 | grep GFLOPS >> tmp.dat
   echo adcmbn-udavcb-vmnu 7200 100 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,a,v,c,b v,m,n,u a,d,c,m,b,n a:8,c:9,b:10,d:10,m:10,n:10,u:8,v:8 | grep GFLOPS >> tmp.dat
   echo acnmdb-udavcb-vmnu 7200 100 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,d,a,v,c,b v,m,n,u a,c,n,m,d,b a:8,c:9,b:10,d:10,m:10,n:10,u:8,v:8 | grep GFLOPS >> tmp.dat
   echo bmac-wvbuca-mvuw 720 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,v,b,u,c,a m,v,u,w b,m,a,c a:9,c:10,b:8,m:1000,u:10,w:8,v:10 | grep GFLOPS >> tmp.dat
   echo cbma-wvbuca-mvuw 720 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,v,b,u,c,a m,v,u,w c,b,m,a a:9,c:8,b:10,m:1000,u:10,w:8,v:10 | grep GFLOPS >> tmp.dat
   echo bamc-wvbuca-wuvm 720 972 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,v,b,u,c,a w,u,v,m b,a,m,c a:9,c:10,b:8,m:972,u:10,w:8,v:10 | grep GFLOPS >> tmp.dat
   echo macb-wuvm-wvbuca 960 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,v,m w,v,b,u,c,a m,a,c,b a:10,c:10,b:10,m:960,u:10,w:8,v:10 | grep GFLOPS >> tmp.dat
   echo anmbc-uvawcb-vwnum 720 1024 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,w,c,b v,w,n,u,m a,n,m,b,c a:8,c:9,b:10,m:32,n:32,u:8,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo ancmb-uvawcb-vwnum 720 1024 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,w,c,b v,w,n,u,m a,n,c,m,b a:8,c:9,b:10,m:32,n:32,u:8,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo mbnca-vmwun-uvawcb 960 1000 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,w,u,n u,v,a,w,c,b m,b,n,c,a a:10,c:10,b:10,m:32,n:30,u:8,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo bnmca-uvawcb-vmwun 720 1024 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,w,c,b v,m,w,u,n b,n,m,c,a a:9,c:10,b:8,m:32,n:32,u:8,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo nmcoba-muwvno-vwubca 576 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,w,v,n,o v,w,u,b,c,a n,m,c,o,b,a a:10,c:10,b:10,m:8,o:9,n:8,u:10,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo ombnac-muwvno-vwubca 576 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,w,v,n,o v,w,u,b,c,a o,m,b,n,a,c a:10,c:10,b:10,m:8,o:8,n:9,u:10,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo anbomc-vwubca-onwmuv 720 800 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,u,b,c,a o,n,w,m,u,v a,n,b,o,m,c a:8,c:9,b:10,m:10,o:8,n:10,u:10,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo nbamco-onwmuv-vwubca 576 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,w,m,u,v v,w,u,b,c,a n,b,a,m,c,o a:10,c:10,b:10,m:9,o:8,n:8,u:10,w:10,v:8 | grep GFLOPS >> tmp.dat
   echo anm-au-umn 144 17280 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u u,m,n a,n,m a:144,m:128,u:144,n:135 | grep GFLOPS >> tmp.dat
   echo man-umn-au 19440 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n a,u m,a,n a:144,m:144,u:144,n:135 | grep GFLOPS >> tmp.dat
   echo man-nmu-au 20736 144 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u m,a,n a:144,u:135,m:144,n:144 | grep GFLOPS >> tmp.dat
   echo mna-nmu-au 20736 144 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u m,n,a a:144,u:135,m:144,n:144 | grep GFLOPS >> tmp.dat
   echo oman-mnuo-au 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o a,u o,m,a,n a:40,u:40,m:40,o:40,n:36 | grep GFLOPS >> tmp.dat
   echo anom-au-mnuo 48 64000 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u m,n,u,o a,n,o,m a:48,u:40,m:40,o:40,n:40 | grep GFLOPS >> tmp.dat
   echo onma-umno-au 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,o a,u o,n,m,a a:40,m:36,u:40,o:40,n:40 | grep GFLOPS >> tmp.dat
   echo nmao-umno-au 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,o a,u n,m,a,o a:40,m:36,u:40,o:40,n:40 | grep GFLOPS >> tmp.dat
   echo pomna-upmon-ua 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,m,o,n u,a p,o,m,n,a a:16,m:18,o:20,n:20,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo pnaom-upmon-ua 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,m,o,n u,a p,n,a,o,m a:16,m:18,o:20,n:20,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo ompna-onupm-ua 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,u,p,m u,a o,m,p,n,a a:16,m:18,o:16,n:20,p:20,u:16 | grep GFLOPS >> tmp.dat
   echo namop-onupm-ua 92160 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,u,p,m u,a n,a,m,o,p a:16,m:18,o:16,n:16,p:20,u:16 | grep GFLOPS >> tmp.dat
   echo panqmo-qonump-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py q,o,n,u,m,p a,u p,a,n,q,m,o a:8,m:12,o:12,n:12,q:8,p:8,u:12 | grep GFLOPS >> tmp.dat
   echo pomqna-qonump-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py q,o,n,u,m,p a,u p,o,m,q,n,a a:8,m:12,o:12,n:12,q:8,p:8,u:12 | grep GFLOPS >> tmp.dat
   echo noaqpm-muopqn-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,p,q,n a,u n,o,a,q,p,m a:8,m:8,o:12,n:8,q:12,p:12,u:12 | grep GFLOPS >> tmp.dat
   echo qoapmn-muopqn-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,p,q,n a,u q,o,a,p,m,n a:8,m:8,o:12,n:12,q:8,p:12,u:12 | grep GFLOPS >> tmp.dat
   echo mab-mu-aub 144 19440 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u a,u,b m,a,b a:144,m:144,b:135,u:135 | grep GFLOPS >> tmp.dat
   echo bam-aub-mu 20736 144 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b m,u b,a,m a:144,m:144,b:144,u:135 | grep GFLOPS >> tmp.dat
   echo amb-aub-um 19440 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b u,m a,m,b a:144,m:128,b:135,u:144 | grep GFLOPS >> tmp.dat
   echo bam-aub-um 20736 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b u,m b,a,m a:144,m:128,b:144,u:144 | grep GFLOPS >> tmp.dat
   echo bnma-uba-mnu 1440 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a m,n,u b,n,m,a a:36,u:1536,b:40,m:40,n:40 | grep GFLOPS >> tmp.dat
   echo nmab-mnu-uba 1920 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u u,b,a n,m,a,b a:40,u:1536,b:40,m:48,n:40 | grep GFLOPS >> tmp.dat
   echo nbma-umn-uba 1440 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n u,b,a n,b,m,a a:40,u:1536,b:40,m:36,n:40 | grep GFLOPS >> tmp.dat
   echo anmb-uba-umn 1440 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a u,m,n a,n,m,b a:40,u:1536,b:36,m:40,n:40 | grep GFLOPS >> tmp.dat
   echo ma-vum-vau 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m v,a,u m,a a:128,m:144,u:135,v:144 | grep GFLOPS >> tmp.dat
   echo am-vau-vum 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u v,u,m a,m a:144,m:128,u:135,v:144 | grep GFLOPS >> tmp.dat
   echo ma-vmu-vau 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u v,a,u m,a a:128,u:135,m:144,v:144 | grep GFLOPS >> tmp.dat
   echo am-vau-vmu 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u v,m,u a,m a:144,m:128,u:135,v:144 | grep GFLOPS >> tmp.dat
   echo monba-noum-abu 4608 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,u,m a,b,u m,o,n,b,a a:16,b:20,m:16,o:18,n:16,u:324 | grep GFLOPS >> tmp.dat
   echo amnbo-abu-noum 288 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u n,o,u,m a,m,n,b,o a:16,b:18,m:20,o:20,n:16,u:324 | grep GFLOPS >> tmp.dat
   echo bmnao-abu-ounm 384 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u o,u,n,m b,m,n,a,o a:24,b:16,m:20,o:16,n:20,u:324 | grep GFLOPS >> tmp.dat
   echo omnba-ounm-abu 5760 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,n,m a,b,u o,m,n,b,a a:16,b:20,m:18,o:16,n:20,u:324 | grep GFLOPS >> tmp.dat
   echo anm-auv-umvn 1536 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v u,m,v,n a,n,m a:1536,m:40,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo nma-umvn-auv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v,n a,u,v n,m,a a:1536,m:36,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo anm-auv-vnum 1536 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v v,n,u,m a,n,m a:1536,m:40,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo nam-vnum-auv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,u,m a,u,v n,a,m a:1536,m:36,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo onampb-omunp-bau 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,u,n,p b,a,u o,n,a,m,p,b a:12,b:8,m:12,o:8,n:12,p:12,u:128 | grep GFLOPS >> tmp.dat
   echo mnbpao-omunp-bau 9216 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,u,n,p b,a,u m,n,b,p,a,o a:12,b:8,m:8,o:8,n:12,p:12,u:128 | grep GFLOPS >> tmp.dat
   echo nbmpao-uponm-bau 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,o,n,m b,a,u n,b,m,p,a,o a:12,b:8,m:12,o:12,n:8,p:12,u:128 | grep GFLOPS >> tmp.dat
   echo omnbpa-uponm-bau 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,o,n,m b,a,u o,m,n,b,p,a a:12,b:8,m:12,o:8,n:12,p:12,u:128 | grep GFLOPS >> tmp.dat
   echo amno-avu-nvoum 288 6400 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u n,v,o,u,m a,m,n,o a:288,m:20,o:20,n:16,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo mano-nvoum-avu 4608 320 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,o,u,m a,v,u m,a,n,o a:320,m:16,o:18,n:16,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo amon-avu-vnuom 288 8000 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u v,n,u,o,m a,m,o,n a:288,m:20,o:20,n:20,u:20,v:16 | grep GFLOPS >> tmp.dat
   echo oanm-vnuom-avu 5760 320 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,u,o,m a,v,u o,a,n,m a:320,m:18,o:16,n:20,u:20,v:16 | grep GFLOPS >> tmp.dat
   echo pamno-opunvm-avu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,p,u,n,v,m a,v,u p,a,m,n,o a:128,m:12,o:8,n:12,p:8,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo panmo-opunvm-avu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,p,u,n,v,m a,v,u p,a,n,m,o a:128,m:12,o:8,n:12,p:8,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo amopn-avu-nmuvpo 120 13824 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u n,m,u,v,p,o a,m,o,p,n a:120,m:12,o:12,n:8,p:12,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo apmno-avu-nmuvpo 120 13824 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u n,m,u,v,p,o a,p,m,n,o a:120,m:12,o:12,n:8,p:12,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo macb-mu-abcu 48 64000 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u a,b,c,u m,a,c,b a:40,m:48,c:40,b:40,u:40 | grep GFLOPS >> tmp.dat
   echo cbma-abcu-mu 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,c,u m,u c,b,m,a a:40,m:40,c:40,b:36,u:40 | grep GFLOPS >> tmp.dat
   echo cbma-abcu-um 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,c,u u,m c,b,m,a a:40,m:40,c:40,b:36,u:40 | grep GFLOPS >> tmp.dat
   echo camb-abcu-um 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,c,u u,m c,a,m,b a:40,m:40,c:40,b:36,u:40 | grep GFLOPS >> tmp.dat
   echo nabmc-num-caub 288 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m c,a,u,b n,a,b,m,c a:20,c:16,b:20,m:18,n:16,u:324 | grep GFLOPS >> tmp.dat
   echo cnmab-caub-num 5760 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b n,u,m c,n,m,a,b a:18,c:16,b:20,m:20,n:16,u:324 | grep GFLOPS >> tmp.dat
   echo ambcn-caub-mnu 4608 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b m,n,u a,m,b,c,n a:16,c:16,b:18,m:16,n:20,u:324 | grep GFLOPS >> tmp.dat
   echo nbacm-mnu-caub 384 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u c,a,u,b n,b,a,c,m a:20,c:16,b:20,m:24,n:16,u:324 | grep GFLOPS >> tmp.dat
   echo bma-uvba-umv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,b,a u,m,v b,m,a a:36,m:1536,b:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo abm-uvba-umv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,b,a u,m,v a,b,m a:40,m:1536,b:36,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo mab-vum-uvba 1536 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m u,v,b,a m,a,b a:40,m:1536,b:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo bma-uvba-vum 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,b,a v,u,m b,m,a a:36,m:1536,b:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo maocnb-mnou-abcu 1152 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,o,u a,b,c,u m,a,o,c,n,b a:8,c:12,b:12,m:8,o:12,n:12,u:1500 | grep GFLOPS >> tmp.dat
   echo mcnboa-mnou-abcu 1152 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,o,u a,b,c,u m,c,n,b,o,a a:8,c:12,b:12,m:8,o:12,n:12,u:1500 | grep GFLOPS >> tmp.dat
   echo cmboan-abcu-omun 768 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,c,u o,m,u,n c,m,b,o,a,n a:8,c:8,b:12,m:12,o:8,n:12,u:1500 | grep GFLOPS >> tmp.dat
   echo onbacm-omun-abcu 1152 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,u,n a,b,c,u o,n,b,a,c,m a:8,c:12,b:12,m:12,o:8,n:12,u:1500 | grep GFLOPS >> tmp.dat
   echo bman-aubv-vmun 1920 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v v,m,u,n b,m,a,n a:48,b:40,m:40,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo nbma-vmun-aubv 1440 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u,n a,u,b,v n,b,m,a a:40,b:40,m:36,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo nbma-mvun-aubv 1920 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,n a,u,b,v n,b,m,a a:40,b:40,m:48,n:40,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo mnba-mvun-aubv 1440 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,n a,u,b,v m,n,b,a a:40,b:40,m:40,n:36,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo ma-mvuw-awuv 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,w a,w,u,v m,a a:40,u:40,m:48,w:40,v:40 | grep GFLOPS >> tmp.dat
   echo am-awuv-mvuw 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,w,u,v m,v,u,w a,m a:48,m:40,u:40,w:40,v:40 | grep GFLOPS >> tmp.dat
   echo ma-vwmu-awuv 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,m,u a,w,u,v m,a a:40,u:40,m:48,w:40,v:40 | grep GFLOPS >> tmp.dat
   echo am-awuv-vwmu 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,w,u,v v,w,m,u a,m a:48,m:40,u:40,w:40,v:40 | grep GFLOPS >> tmp.dat
   echo noabm-uvnmo-aubv 5760 288 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,n,m,o a,u,b,v n,o,a,b,m a:16,b:18,m:18,o:20,n:16,u:16,v:20 | grep GFLOPS >> tmp.dat
   echo abomn-aubv-uvnmo 288 8000 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v u,v,n,m,o a,b,o,m,n a:16,b:18,m:20,o:20,n:20,u:16,v:20 | grep GFLOPS >> tmp.dat
   echo oabmn-unvmo-aubv 5760 288 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,v,m,o a,u,b,v o,a,b,m,n a:16,b:18,m:18,o:16,n:20,u:16,v:20 | grep GFLOPS >> tmp.dat
   echo abnom-aubv-unvmo 288 8000 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v u,n,v,m,o a,b,n,o,m a:16,b:18,m:20,o:20,n:20,u:16,v:20 | grep GFLOPS >> tmp.dat
   echo amn-uvwa-vnuwm 288 400 5120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a v,n,u,w,m a,m,n a:288,m:20,n:20,u:16,w:20,v:16 | grep GFLOPS >> tmp.dat
   echo man-vnuwm-uvwa 288 324 5120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,u,w,m u,v,w,a m,a,n a:324,m:16,n:18,u:16,w:20,v:16 | grep GFLOPS >> tmp.dat
   echo man-unvmw-uvwa 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,v,m,w u,v,w,a m,a,n a:324,m:16,n:18,u:16,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo amn-uvwa-unvmw 288 400 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a u,n,v,m,w a,m,n a:288,m:20,n:20,u:16,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo maonbp-umnpvo-aubv 13824 96 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,p,v,o a,u,b,v m,a,o,n,b,p a:8,b:12,m:8,o:12,n:12,p:12,u:8,v:12 | grep GFLOPS >> tmp.dat
   echo aonbpm-aubv-umnpvo 96 20736 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v u,m,n,p,v,o a,o,n,b,p,m a:8,b:12,m:12,o:12,n:12,p:12,u:8,v:12 | grep GFLOPS >> tmp.dat
   echo onapbm-mvpoun-aubv 9216 96 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,p,o,u,n a,u,b,v o,n,a,p,b,m a:8,b:12,m:8,o:8,n:12,p:12,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo mopnab-mvpoun-aubv 13824 96 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,p,o,u,n a,u,b,v m,o,p,n,a,b a:8,b:12,m:8,o:12,n:12,p:12,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo noma-nmvuow-auvw 1152 1536 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,v,u,o,w a,u,v,w n,o,m,a a:1536,m:12,o:12,n:8,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo anom-auvw-nmvuow 1536 1152 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w n,m,v,u,o,w a,n,o,m a:1536,m:12,o:12,n:8,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo mano-vnwomu-auvw 1152 1536 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,w,o,m,u a,u,v,w m,a,n,o a:1536,m:8,o:12,n:12,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo amon-auvw-vnwomu 1536 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w v,n,w,o,m,u a,m,o,n a:1536,m:12,o:12,n:12,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo dmbac-buadc-um 92160 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a,d,c u,m d,m,b,a,c a:18,c:20,b:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo bmacd-buadc-um 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a,d,c u,m b,m,a,c,d a:18,c:20,b:16,d:20,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo dbcam-buadc-mu 92160 16 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a,d,c m,u d,b,c,a,m a:18,c:20,b:16,d:16,m:16,u:20 | grep GFLOPS >> tmp.dat
   echo mcdba-mu-buadc 24 128000 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,u,a,d,c m,c,d,b,a a:20,c:20,b:16,d:20,m:24,u:20 | grep GFLOPS >> tmp.dat
   echo bcndma-uacdb-nmu 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,d,b n,m,u b,c,n,d,m,a a:12,c:12,b:8,d:12,m:12,n:8,u:128 | grep GFLOPS >> tmp.dat
   echo dmcanb-uacdb-nmu 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,d,b n,m,u d,m,c,a,n,b a:12,c:12,b:12,d:8,m:12,n:8,u:128 | grep GFLOPS >> tmp.dat
   echo badmnc-uacdb-unm 13824 144 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,d,b u,n,m b,a,d,m,n,c a:12,c:12,b:8,d:12,m:12,n:12,u:128 | grep GFLOPS >> tmp.dat
   echo nbcmad-unm-uacdb 96 20736 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m u,a,c,d,b n,b,c,m,a,d a:12,c:12,b:12,d:12,m:12,n:8,u:128 | grep GFLOPS >> tmp.dat
   echo bmca-aubcv-uvm 4608 324 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,c,v u,v,m b,m,c,a a:16,c:18,b:16,m:324,u:16,v:20 | grep GFLOPS >> tmp.dat
   echo mbac-uvm-aubcv 288 6400 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m a,u,b,c,v m,b,a,c a:16,c:20,b:20,m:288,u:16,v:20 | grep GFLOPS >> tmp.dat
   echo bamc-aubcv-vum 4608 324 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,c,v v,u,m b,a,m,c a:16,c:18,b:16,m:324,u:20,v:16 | grep GFLOPS >> tmp.dat
   echo cmba-aubcv-vum 4608 324 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,c,v v,u,m c,m,b,a a:16,c:16,b:18,m:324,u:20,v:16 | grep GFLOPS >> tmp.dat
   echo bmacn-cubav-mnuv 4608 288 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,u,b,a,v m,n,u,v b,m,a,c,n a:18,c:16,b:16,m:16,n:18,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo bcanm-cubav-mnuv 4608 288 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,u,b,a,v m,n,u,v b,c,a,n,m a:18,c:16,b:16,m:16,n:18,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo nbcam-mnvu-cubav 384 6400 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u c,u,b,a,v n,b,c,a,m a:20,c:16,b:20,m:24,n:16,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo mcanb-mnvu-cubav 288 6400 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u c,u,b,a,v m,c,a,n,b a:20,c:16,b:20,m:16,n:18,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo bma-ubavw-mwvu 288 320 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v,w m,w,v,u b,m,a a:18,b:16,m:320,u:16,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo mab-mwvu-ubavw 288 400 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,w,v,u u,b,a,v,w m,a,b a:20,b:20,m:288,u:16,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo amb-ubavw-uvmw 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v,w u,v,m,w a,m,b a:16,b:18,m:324,u:16,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo bma-ubavw-uvmw 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v,w u,v,m,w b,m,a a:18,b:16,m:324,u:16,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo amcnbo-bvcau-unomv 768 1728 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,c,a,u u,n,o,m,v a,m,c,n,b,o a:8,c:12,b:8,m:12,o:12,n:12,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo mobcna-unomv-bvcau 1152 1152 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,o,m,v b,v,c,a,u m,o,b,c,n,a a:12,c:12,b:8,m:8,o:12,n:12,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo nobmac-uvnmo-bvcau 1152 1152 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,n,m,o b,v,c,a,u n,o,b,m,a,c a:12,c:12,b:8,m:12,o:12,n:8,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo bmaocn-bvcau-uvnmo 1152 1728 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,c,a,u u,v,n,m,o b,m,a,o,c,n a:12,c:12,b:8,m:12,o:12,n:12,u:40,v:40 | grep GFLOPS >> tmp.dat
   echo abmn-auvwb-vunwm 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b v,u,n,w,m a,b,m,n a:16,b:18,m:18,n:18,u:20,w:20,v:16 | grep GFLOPS >> tmp.dat
   echo banm-auvwb-vunwm 384 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b v,u,n,w,m b,a,n,m a:24,b:16,m:18,n:18,u:20,w:20,v:16 | grep GFLOPS >> tmp.dat
   echo abnm-auvwb-wnvum 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b w,n,v,u,m a,b,n,m a:16,b:18,m:18,n:18,u:20,w:16,v:20 | grep GFLOPS >> tmp.dat
   echo anbm-auvwb-wnvum 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,w,b w,n,v,u,m a,n,b,m a:16,b:18,m:18,n:18,u:20,w:16,v:20 | grep GFLOPS >> tmp.dat
   echo moanb-nwmuov-uvwab 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,w,m,u,o,v u,v,w,a,b m,o,a,n,b a:40,b:40,m:8,o:12,n:8,u:8,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo moban-nwmuov-uvwab 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,w,m,u,o,v u,v,w,a,b m,o,b,a,n a:40,b:40,m:8,o:12,n:8,u:8,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo mnbao-ounwvm-uvwab 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,n,w,v,m u,v,w,a,b m,n,b,a,o a:40,b:40,m:8,o:8,n:12,u:8,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo boamn-uvwab-ounwvm 1440 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a,b o,u,n,w,v,m b,o,a,m,n a:36,b:40,m:12,o:8,n:12,u:8,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo mbadec-um-cbduea 24 165888 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m c,b,d,u,e,a m,b,a,d,e,c a:12,c:8,b:12,e:12,d:12,m:24,u:8 | grep GFLOPS >> tmp.dat
   echo mdabec-um-cbduea 24 165888 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m c,b,d,u,e,a m,d,a,b,e,c a:12,c:8,b:12,e:12,d:12,m:24,u:8 | grep GFLOPS >> tmp.dat
   echo bemcad-cbduea-mu 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,d,u,e,a m,u b,e,m,c,a,d a:12,c:8,b:8,e:12,d:12,m:8,u:12 | grep GFLOPS >> tmp.dat
   echo mecdab-mu-cbduea 24 165888 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u c,b,d,u,e,a m,e,c,d,a,b a:12,c:8,b:12,e:12,d:12,m:24,u:12 | grep GFLOPS >> tmp.dat
   echo adcbm-cauvdb-umv 9216 128 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,v,d,b u,m,v a,d,c,b,m a:8,c:8,b:12,d:12,m:128,u:8,v:12 | grep GFLOPS >> tmp.dat
   echo dcmab-cauvdb-umv 9216 128 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,v,d,b u,m,v d,c,m,a,b a:12,c:8,b:12,d:8,m:128,u:8,v:12 | grep GFLOPS >> tmp.dat
   echo dabcm-cauvdb-mvu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,v,d,b m,v,u d,a,b,c,m a:12,c:8,b:12,d:8,m:128,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo dcbam-cauvdb-mvu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,v,d,b m,v,u d,c,b,a,m a:12,c:8,b:12,d:8,m:128,u:12,v:12 | grep GFLOPS >> tmp.dat
   echo cdabnm-vbadcu-uvmn 13824 144 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,d,c,u u,v,m,n c,d,a,b,n,m a:12,c:8,b:12,d:12,m:12,n:12,u:8,v:8 | grep GFLOPS >> tmp.dat
   echo mdnacb-uvmn-vbadcu 96 20736 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m,n v,b,a,d,c,u m,d,n,a,c,b a:12,c:12,b:12,d:12,m:8,n:12,u:8,v:8 | grep GFLOPS >> tmp.dat
   echo mcabdn-mvnu-vbadcu 96 20736 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,n,u v,b,a,d,c,u m,c,a,b,d,n a:12,c:12,b:12,d:12,m:8,n:12,u:12,v:8 | grep GFLOPS >> tmp.dat
   echo ndacbm-mvnu-vbadcu 192 20736 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,n,u v,b,a,d,c,u n,d,a,c,b,m a:12,c:12,b:12,d:12,m:24,n:8,u:12,v:8 | grep GFLOPS >> tmp.dat
   echo abmc-auvbwc-mvuw 1152 1536 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b,w,c m,v,u,w a,b,m,c a:8,c:12,b:12,m:1536,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo bcam-auvbwc-mvuw 768 1536 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b,w,c m,v,u,w b,c,a,m a:8,c:12,b:8,m:1536,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo cbam-auvbwc-vwmu 768 1500 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b,w,c v,w,m,u c,b,a,m a:8,c:8,b:12,m:1500,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo mcba-vwmu-auvbwc 1536 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,m,u a,u,v,b,w,c m,c,b,a a:8,c:12,b:12,m:1536,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo cmanb-auwvcb-vumwn 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,w,v,c,b v,u,m,w,n c,m,a,n,b a:8,c:8,b:12,m:40,n:40,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo mabcn-vumwn-auwvcb 1440 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m,w,n a,u,w,v,c,b m,a,b,c,n a:8,c:12,b:12,m:40,n:36,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo bmcna-auwvcb-nmwuv 768 1600 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,w,v,c,b n,m,w,u,v b,m,c,n,a a:8,c:12,b:8,m:40,n:40,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo bmacn-auwvcb-nmwuv 768 1600 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,w,v,c,b n,m,w,u,v b,m,a,c,n a:8,c:12,b:8,m:40,n:40,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo nobacm-vunwom-bvcwau 1152 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,n,w,o,m b,v,c,w,a,u n,o,b,a,c,m a:12,c:12,b:8,m:12,o:12,n:8,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo abmnoc-bvcwau-vunwom 768 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,c,w,a,u v,u,n,w,o,m a,b,m,n,o,c a:8,c:12,b:8,m:12,o:12,n:12,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo cbanom-bvcwau-vnmwuo 768 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,c,w,a,u v,n,m,w,u,o c,b,a,n,o,m a:12,c:8,b:8,m:12,o:12,n:12,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo camnob-bvcwau-vnmwuo 768 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,c,w,a,u v,n,m,w,u,o c,a,m,n,o,b a:12,c:8,b:8,m:12,o:12,n:12,u:12,w:12,v:8 | grep GFLOPS >> tmp.dat
   echo amn-ua-num 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a n,u,m a,m,n a:144,m:160,u:160,n:160 | grep GFLOPS >> tmp.dat
   echo mna-num-ua 23040 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m u,a m,n,a a:160,m:144,u:160,n:160 | grep GFLOPS >> tmp.dat
   echo nam-unm-ua 25920 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m u,a n,a,m a:160,m:162,u:160,n:160 | grep GFLOPS >> tmp.dat
   echo amn-ua-unm 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a u,n,m a,m,n a:144,m:160,u:160,n:160 | grep GFLOPS >> tmp.dat
   echo amon-au-unom 48 97200 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u u,n,o,m a,m,o,n a:48,m:48,u:48,o:45,n:45 | grep GFLOPS >> tmp.dat
   echo mnao-unom-au 97200 40 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,o,m a,u m,n,a,o a:40,m:48,u:48,o:45,n:45 | grep GFLOPS >> tmp.dat
   echo onma-moun-au 103680 40 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,u,n a,u o,n,m,a a:40,u:45,m:48,o:48,n:45 | grep GFLOPS >> tmp.dat
   echo noma-moun-au 103680 40 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,u,n a,u n,o,m,a a:40,u:45,m:48,o:45,n:48 | grep GFLOPS >> tmp.dat
   echo aonpm-ua-nupom 24 192000 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a n,u,p,o,m a,o,n,p,m a:24,m:20,o:20,n:24,p:20,u:24 | grep GFLOPS >> tmp.dat
   echo onmap-nupom-ua 230400 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,p,o,m u,a o,n,m,a,p a:20,m:20,o:24,n:24,p:20,u:24 | grep GFLOPS >> tmp.dat
   echo ponma-uomnp-ua 192000 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,m,n,p u,a p,o,n,m,a a:20,m:20,o:20,n:20,p:24,u:24 | grep GFLOPS >> tmp.dat
   echo ampno-ua-uomnp 24 160000 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a u,o,m,n,p a,m,p,n,o a:24,m:20,o:20,n:20,p:20,u:24 | grep GFLOPS >> tmp.dat
   echo pqanmo-umnoqp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,o,q,p a,u p,q,a,n,m,o a:8,m:12,o:12,n:12,q:12,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo mponaq-umnoqp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,o,q,p a,u m,p,o,n,a,q a:8,m:16,o:12,n:12,q:12,p:12,u:16 | grep GFLOPS >> tmp.dat
   echo qnopam-umqonp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,q,o,n,p a,u q,n,o,p,a,m a:8,m:12,o:12,n:12,q:16,p:12,u:16 | grep GFLOPS >> tmp.dat
   echo mopqna-umqonp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,q,o,n,p a,u m,o,p,q,n,a a:8,m:16,o:12,n:12,q:12,p:12,u:16 | grep GFLOPS >> tmp.dat
   echo bma-bau-mu 25920 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,u m,u b,m,a a:162,m:160,b:160,u:160 | grep GFLOPS >> tmp.dat
   echo mab-mu-bau 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,a,u m,a,b a:160,m:144,b:160,u:160 | grep GFLOPS >> tmp.dat
   echo bma-bau-um 25920 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,u u,m b,m,a a:162,m:160,b:160,u:160 | grep GFLOPS >> tmp.dat
   echo mab-um-bau 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m b,a,u m,a,b a:160,m:144,b:160,u:160 | grep GFLOPS >> tmp.dat
   echo ambn-bua-umn 2304 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a u,m,n a,m,b,n a:48,u:1944,b:48,m:48,n:45 | grep GFLOPS >> tmp.dat
   echo anmb-bua-umn 2304 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a u,m,n a,n,m,b a:48,u:1944,b:48,m:48,n:45 | grep GFLOPS >> tmp.dat
   echo amnb-bua-nmu 2304 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a n,m,u a,m,n,b a:48,u:1944,b:48,m:45,n:48 | grep GFLOPS >> tmp.dat
   echo bman-bua-nmu 2160 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a n,m,u b,m,a,n a:45,u:1944,b:48,m:45,n:48 | grep GFLOPS >> tmp.dat
   echo ma-mvu-auv 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u a,u,v m,a a:160,u:160,m:144,v:160 | grep GFLOPS >> tmp.dat
   echo am-auv-mvu 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v m,v,u a,m a:144,m:160,u:160,v:160 | grep GFLOPS >> tmp.dat
   echo ma-vmu-auv 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u a,u,v m,a a:160,u:160,m:144,v:160 | grep GFLOPS >> tmp.dat
   echo am-auv-vmu 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v v,m,u a,m a:144,m:160,u:160,v:160 | grep GFLOPS >> tmp.dat
   echo anomb-uab-monu 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b m,o,n,u a,n,o,m,b a:24,b:20,m:24,o:20,n:20,u:432 | grep GFLOPS >> tmp.dat
   echo ombna-monu-uab 11520 400 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,n,u u,a,b o,m,b,n,a a:20,b:20,m:24,o:24,n:20,u:432 | grep GFLOPS >> tmp.dat
   echo bmaon-uab-nmuo 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b n,m,u,o b,m,a,o,n a:20,b:24,m:20,o:20,n:24,u:432 | grep GFLOPS >> tmp.dat
   echo noamb-nmuo-uab 9600 400 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u,o u,a,b n,o,a,m,b a:20,b:20,m:20,o:20,n:24,u:432 | grep GFLOPS >> tmp.dat
   echo nam-nuvm-vua 2160 1944 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,v,m v,u,a n,a,m a:1944,m:45,v:48,u:45,n:48 | grep GFLOPS >> tmp.dat
   echo anm-vua-nuvm 1944 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a n,u,v,m a,n,m a:1944,m:45,v:48,u:45,n:48 | grep GFLOPS >> tmp.dat
   echo mna-unmv-vua 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,v v,u,a m,n,a a:1944,m:48,v:48,u:48,n:45 | grep GFLOPS >> tmp.dat
   echo man-unmv-vua 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,v v,u,a m,a,n a:1944,m:48,v:48,u:48,n:45 | grep GFLOPS >> tmp.dat
   echo omnapb-upmon-uba 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,m,o,n u,b,a o,m,n,a,p,b a:12,b:12,m:12,o:16,n:12,p:12,u:144 | grep GFLOPS >> tmp.dat
   echo apnobm-uba-upmon 192 20736 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a u,p,m,o,n a,p,n,o,b,m a:16,b:12,m:12,o:12,n:12,p:12,u:144 | grep GFLOPS >> tmp.dat
   echo opamnb-umonp-uba 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,o,n,p u,b,a o,p,a,m,n,b a:12,b:12,m:12,o:16,n:12,p:12,u:144 | grep GFLOPS >> tmp.dat
   echo mnaobp-umonp-uba 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,o,n,p u,b,a m,n,a,o,b,p a:12,b:12,m:16,o:12,n:12,p:12,u:144 | grep GFLOPS >> tmp.dat
   echo amon-auv-uovnm 432 8000 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v u,o,v,n,m a,m,o,n a:432,m:20,o:20,n:20,u:24,v:20 | grep GFLOPS >> tmp.dat
   echo mnoa-uovnm-auv 9600 432 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,v,n,m a,u,v m,n,o,a a:432,m:24,o:20,n:20,u:24,v:20 | grep GFLOPS >> tmp.dat
   echo oamn-numov-auv 11520 432 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m,o,v a,u,v o,a,m,n a:432,m:20,o:24,n:24,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo naom-numov-auv 9600 432 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m,o,v a,u,v n,a,o,m a:432,m:20,o:20,n:24,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo poanm-vunomp-auv 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,n,o,m,p a,u,v p,o,a,n,m a:144,m:12,o:12,n:12,p:16,u:12,v:16 | grep GFLOPS >> tmp.dat
   echo opmna-vunomp-auv 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,n,o,m,p a,u,v o,p,m,n,a a:144,m:12,o:16,n:12,p:12,u:12,v:16 | grep GFLOPS >> tmp.dat
   echo pmnoa-vonpum-auv 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,o,n,p,u,m a,u,v p,m,n,o,a a:144,m:12,o:12,n:12,p:16,u:12,v:16 | grep GFLOPS >> tmp.dat
   echo anomp-auv-vonpum 144 20736 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v v,o,n,p,u,m a,n,o,m,p a:144,m:12,o:12,n:12,p:12,u:12,v:16 | grep GFLOPS >> tmp.dat
   echo bcam-cbua-um 103680 48 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a u,m b,c,a,m a:45,m:48,c:48,b:48,u:48 | grep GFLOPS >> tmp.dat
   echo abcm-cbua-um 103680 48 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a u,m a,b,c,m a:48,m:48,c:48,b:45,u:48 | grep GFLOPS >> tmp.dat
   echo cmab-cbua-mu 97200 40 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a m,u c,m,a,b a:45,m:40,c:48,b:45,u:45 | grep GFLOPS >> tmp.dat
   echo mbac-mu-cbua 48 97200 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u c,b,u,a m,b,a,c a:45,m:48,c:48,b:45,u:45 | grep GFLOPS >> tmp.dat
   echo bancm-aucb-mnu 11520 480 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,c,b m,n,u b,a,n,c,m a:24,c:20,b:24,m:24,n:20,u:432 | grep GFLOPS >> tmp.dat
   echo ancmb-aucb-mnu 9600 480 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,c,b m,n,u a,n,c,m,b a:24,c:20,b:20,m:24,n:20,u:432 | grep GFLOPS >> tmp.dat
   echo nmcab-num-aucb 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m a,u,c,b n,m,c,a,b a:24,c:20,b:20,m:20,n:24,u:432 | grep GFLOPS >> tmp.dat
   echo nbamc-num-aucb 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m a,u,c,b n,b,a,m,c a:24,c:20,b:20,m:20,n:24,u:432 | grep GFLOPS >> tmp.dat
   echo abm-vaub-uvm 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u,b u,v,m a,b,m a:48,m:1944,b:45,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo bam-vaub-uvm 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u,b u,v,m b,a,m a:45,m:1944,b:48,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo abm-vaub-muv 2160 1944 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u,b m,u,v a,b,m a:48,m:1944,b:45,u:45,v:48 | grep GFLOPS >> tmp.dat
   echo bam-vaub-muv 2160 1944 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u,b m,u,v b,a,m a:45,m:1944,b:48,u:45,v:48 | grep GFLOPS >> tmp.dat
   echo baocmn-cbua-nmuo 3072 2304 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a n,m,u,o b,a,o,c,m,n a:12,c:16,b:16,m:12,o:12,n:16,u:1800 | grep GFLOPS >> tmp.dat
   echo nbcamo-nmuo-cbua 2304 2304 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u,o c,b,u,a n,b,c,a,m,o a:12,c:16,b:12,m:12,o:12,n:16,u:1800 | grep GFLOPS >> tmp.dat
   echo bcnaom-cbua-umno 3072 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a u,m,n,o b,c,n,a,o,m a:12,c:16,b:16,m:12,o:12,n:12,u:1800 | grep GFLOPS >> tmp.dat
   echo aonmbc-cbua-umno 3072 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,a u,m,n,o a,o,n,m,b,c a:16,c:16,b:12,m:12,o:12,n:12,u:1800 | grep GFLOPS >> tmp.dat
   echo bnam-uvab-nvmu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,b n,v,m,u b,n,a,m a:45,b:48,m:45,n:48,u:48,v:45 | grep GFLOPS >> tmp.dat
   echo amnb-uvab-nvmu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,b n,v,m,u a,m,n,b a:48,b:45,m:45,n:48,u:48,v:45 | grep GFLOPS >> tmp.dat
   echo anmb-uvab-mnvu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,b m,n,v,u a,n,m,b a:48,b:45,m:48,n:45,u:48,v:45 | grep GFLOPS >> tmp.dat
   echo bnma-uvab-mnvu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,b m,n,v,u b,n,m,a a:45,b:48,m:48,n:45,u:48,v:45 | grep GFLOPS >> tmp.dat
   echo ma-uvwm-uawv 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,m u,a,w,v m,a a:48,m:48,u:48,w:45,v:45 | grep GFLOPS >> tmp.dat
   echo am-uawv-uvwm 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,w,v u,v,w,m a,m a:48,m:48,u:48,w:45,v:45 | grep GFLOPS >> tmp.dat
   echo ma-uwmv-uawv 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,m,v u,a,w,v m,a a:48,m:48,u:48,w:45,v:45 | grep GFLOPS >> tmp.dat
   echo am-uawv-uwmv 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,w,v u,w,m,v a,m a:48,m:48,u:48,w:45,v:45 | grep GFLOPS >> tmp.dat
   echo nabmo-uvmno-vaub 9600 400 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m,n,o v,a,u,b n,a,b,m,o a:20,b:20,m:20,o:20,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo nboam-uvmno-vaub 9600 400 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m,n,o v,a,u,b n,b,o,a,m a:20,b:20,m:20,o:20,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo nobam-mnuov-vaub 11520 400 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o,v v,a,u,b n,o,b,a,m a:20,b:20,m:24,o:20,n:24,u:20,v:24 | grep GFLOPS >> tmp.dat
   echo mbnao-mnuov-vaub 9600 400 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o,v v,a,u,b m,b,n,a,o a:20,b:20,m:24,o:20,n:20,u:20,v:24 | grep GFLOPS >> tmp.dat
   echo nma-vwmnu-wvau 480 432 11520 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,m,n,u w,v,a,u n,m,a a:432,m:20,n:24,u:20,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo nam-vwmnu-wvau 480 432 11520 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,m,n,u w,v,a,u n,a,m a:432,m:20,n:24,u:20,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo mna-wmvun-wvau 480 432 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,v,u,n w,v,a,u m,n,a a:432,m:24,n:20,u:20,w:24,v:20 | grep GFLOPS >> tmp.dat
   echo nma-wmvun-wvau 480 432 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,v,u,n w,v,a,u n,m,a a:432,m:20,n:24,u:20,w:24,v:20 | grep GFLOPS >> tmp.dat
   echo manbop-pvnuom-ubva 36864 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,v,n,u,o,m u,b,v,a m,a,n,b,o,p a:12,b:12,m:16,o:12,n:12,p:16,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo boanpm-ubva-pvnuom 96 27648 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,a p,v,n,u,o,m b,o,a,n,p,m a:12,b:8,m:12,o:12,n:12,p:16,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo obnpam-punvom-ubva 36864 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,u,n,v,o,m u,b,v,a o,b,n,p,a,m a:12,b:12,m:12,o:16,n:12,p:16,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo apmnbo-ubva-punvom 96 27648 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,a p,u,n,v,o,m a,p,m,n,b,o a:8,b:12,m:12,o:12,n:12,p:16,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo mnoa-vomwnu-wavu 2304 1800 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,o,m,w,n,u w,a,v,u m,n,o,a a:1800,m:16,o:12,n:12,u:12,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo anmo-wavu-vomwnu 1800 1728 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,a,v,u v,o,m,w,n,u a,n,m,o a:1800,m:12,o:12,n:12,u:12,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo oanm-muonvw-wavu 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,n,v,w w,a,v,u o,a,n,m a:1800,m:16,o:16,n:12,u:12,w:16,v:12 | grep GFLOPS >> tmp.dat
   echo nmao-muonvw-wavu 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,n,v,w w,a,v,u n,m,a,o a:1800,m:16,o:12,n:16,u:12,w:16,v:12 | grep GFLOPS >> tmp.dat
   echo mdbac-mu-budca 24 192000 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,u,d,c,a m,d,b,a,c a:20,c:20,b:24,d:20,m:24,u:20 | grep GFLOPS >> tmp.dat
   echo dabcm-budca-mu 230400 24 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,c,a m,u d,a,b,c,m a:20,c:20,b:24,d:24,m:24,u:20 | grep GFLOPS >> tmp.dat
   echo bmdac-budca-um 192000 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,c,a u,m b,m,d,a,c a:20,c:20,b:24,d:20,m:20,u:24 | grep GFLOPS >> tmp.dat
   echo dbamc-budca-um 230400 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,c,a u,m d,b,a,m,c a:20,c:20,b:24,d:24,m:20,u:24 | grep GFLOPS >> tmp.dat
   echo camdnb-cubad-unm 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,u,b,a,d u,n,m c,a,m,d,n,b a:12,c:16,b:12,d:12,m:12,n:12,u:144 | grep GFLOPS >> tmp.dat
   echo nacdmb-unm-cubad 192 27648 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m c,u,b,a,d n,a,c,d,m,b a:12,c:16,b:12,d:12,m:12,n:16,u:144 | grep GFLOPS >> tmp.dat
   echo cdmbna-cubad-umn 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,u,b,a,d u,m,n c,d,m,b,n,a a:12,c:16,b:12,d:12,m:12,n:12,u:144 | grep GFLOPS >> tmp.dat
   echo ambdcn-cubad-umn 36864 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,u,b,a,d u,m,n a,m,b,d,c,n a:16,c:16,b:12,d:12,m:12,n:12,u:144 | grep GFLOPS >> tmp.dat
   echo bamc-uacbv-vum 9600 432 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,b,v v,u,m b,a,m,c a:20,c:20,b:24,m:432,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo bmca-uacbv-vum 9600 432 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,b,v v,u,m b,m,c,a a:20,c:20,b:24,m:432,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo cabm-uacbv-muv 9600 432 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,b,v m,u,v c,a,b,m a:20,c:24,b:20,m:432,u:24,v:20 | grep GFLOPS >> tmp.dat
   echo bcam-uacbv-muv 9600 432 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,c,b,v m,u,v b,c,a,m a:20,c:20,b:24,m:432,u:24,v:20 | grep GFLOPS >> tmp.dat
   echo mnacb-nvmu-abvuc 576 9600 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,m,u a,b,v,u,c m,n,a,c,b a:24,c:20,b:20,m:24,n:24,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo namcb-nvmu-abvuc 480 9600 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,m,u a,b,v,u,c n,a,m,c,b a:24,c:20,b:20,m:20,n:24,u:20,v:20 | grep GFLOPS >> tmp.dat
   echo mcnba-vmnu-abvuc 480 9600 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,n,u a,b,v,u,c m,c,n,b,a a:24,c:20,b:20,m:24,n:20,u:20,v:24 | grep GFLOPS >> tmp.dat
   echo cbman-abvuc-vmnu 11520 400 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u,c v,m,n,u c,b,m,a,n a:24,c:24,b:20,m:20,n:20,u:20,v:24 | grep GFLOPS >> tmp.dat
   echo amb-avubw-muwv 480 432 8000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,b,w m,u,w,v a,m,b a:24,b:20,m:432,u:20,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo mab-muwv-avubw 432 480 8000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,w,v a,v,u,b,w m,a,b a:24,b:20,m:432,u:20,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo abm-avubw-umvw 480 432 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,b,w u,m,v,w a,b,m a:24,b:20,m:432,u:24,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo mab-umvw-avubw 432 480 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v,w a,v,u,b,w m,a,b a:24,b:20,m:432,u:24,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo nboamc-muonv-avbuc 3072 2304 2025 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,n,v a,v,b,u,c n,b,o,a,m,c a:16,c:12,b:12,m:16,o:12,n:16,u:45,v:45 | grep GFLOPS >> tmp.dat
   echo ocabnm-muonv-avbuc 3072 2304 2025 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,n,v a,v,b,u,c o,c,a,b,n,m a:16,c:12,b:12,m:16,o:16,n:12,u:45,v:45 | grep GFLOPS >> tmp.dat
   echo bcnaom-avbuc-vmuon 3072 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,b,u,c v,m,u,o,n b,c,n,a,o,m a:16,c:12,b:16,m:12,o:12,n:12,u:45,v:40 | grep GFLOPS >> tmp.dat
   echo aocmnb-avbuc-vmuon 2304 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,b,u,c v,m,u,o,n a,o,c,m,n,b a:16,c:12,b:12,m:12,o:12,n:12,u:45,v:40 | grep GFLOPS >> tmp.dat
   echo nabm-uwnmv-awuvb 480 480 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,n,m,v a,w,u,v,b n,a,b,m a:24,b:20,m:20,n:24,u:24,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo bamn-awuvb-uwnmv 576 400 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,w,u,v,b u,w,n,m,v b,a,m,n a:24,b:24,m:20,n:20,u:24,w:20,v:20 | grep GFLOPS >> tmp.dat
   echo anbm-awuvb-wmvnu 480 400 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,w,u,v,b w,m,v,n,u a,n,b,m a:24,b:20,m:20,n:20,u:20,w:24,v:20 | grep GFLOPS >> tmp.dat
   echo nbam-wmvnu-awuvb 480 480 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,v,n,u a,w,u,v,b n,b,a,m a:24,b:20,m:20,n:24,u:20,w:24,v:20 | grep GFLOPS >> tmp.dat
   echo mnoba-wnmvou-vuabw 2304 2160 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,n,m,v,o,u v,u,a,b,w m,n,o,b,a a:48,b:45,m:16,o:12,n:12,u:12,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo amonb-vuabw-wnmvou 1800 1728 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b,w w,n,m,v,o,u a,m,o,n,b a:40,b:45,m:12,o:12,n:12,u:12,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo obman-monuvw-vuabw 3072 2160 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,n,u,v,w v,u,a,b,w o,b,m,a,n a:48,b:45,m:16,o:16,n:12,u:12,w:12,v:16 | grep GFLOPS >> tmp.dat
   echo mbnoa-monuvw-vuabw 2304 2160 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,n,u,v,w v,u,a,b,w m,b,n,o,a a:48,b:45,m:16,o:12,n:12,u:12,w:12,v:16 | grep GFLOPS >> tmp.dat
   echo mbcdea-um-budaec 24 331776 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m b,u,d,a,e,c m,b,c,d,e,a a:12,c:12,b:16,e:12,d:12,m:24,u:16 | grep GFLOPS >> tmp.dat
   echo mbaced-um-budaec 24 331776 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m b,u,d,a,e,c m,b,a,c,e,d a:12,c:12,b:16,e:12,d:12,m:24,u:16 | grep GFLOPS >> tmp.dat
   echo ebdcma-budaec-mu 442368 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,e,c m,u e,b,d,c,m,a a:12,c:12,b:16,e:16,d:12,m:8,u:12 | grep GFLOPS >> tmp.dat
   echo mcabed-mu-budaec 24 331776 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,u,d,a,e,c m,c,a,b,e,d a:12,c:12,b:16,e:12,d:12,m:24,u:12 | grep GFLOPS >> tmp.dat
   echo dcamb-ubacvd-uvm 27648 128 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,c,v,d u,v,m d,c,a,m,b a:12,c:12,b:12,d:16,m:128,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo mbcad-uvm-ubacvd 144 20736 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m u,b,a,c,v,d m,b,c,a,d a:12,c:12,b:12,d:12,m:144,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo ambdc-ubacvd-mvu 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,c,v,d m,v,u a,m,b,d,c a:16,c:12,b:12,d:12,m:144,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo adbmc-ubacvd-mvu 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,c,v,d m,v,u a,d,b,m,c a:16,c:12,b:12,d:12,m:144,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo cbamdn-ubvcda-muvn 27648 96 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,d,a m,u,v,n c,b,a,m,d,n a:12,c:16,b:12,d:12,m:8,n:12,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo acmndb-ubvcda-muvn 27648 96 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,d,a m,u,v,n a,c,m,n,d,b a:16,c:12,b:12,d:12,m:8,n:12,u:16,v:12 | grep GFLOPS >> tmp.dat
   echo bdmacn-ubvcda-vnmu 27648 144 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,d,a v,n,m,u b,d,m,a,c,n a:12,c:12,b:16,d:12,m:12,n:12,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo dmabnc-ubvcda-vnmu 27648 144 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,d,a v,n,m,u d,m,a,b,n,c a:12,c:12,b:12,d:16,m:12,n:12,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mcab-vmuw-acvwub 1800 2304 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u,w a,c,v,w,u,b m,c,a,b a:16,c:12,b:12,m:1800,u:12,w:12,v:16 | grep GFLOPS >> tmp.dat
   echo amcb-acvwub-vmuw 2304 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,v,w,u,b v,m,u,w a,m,c,b a:16,c:12,b:12,m:1800,u:12,w:12,v:16 | grep GFLOPS >> tmp.dat
   echo cmab-acvwub-wmuv 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,v,w,u,b w,m,u,v c,m,a,b a:16,c:16,b:12,m:1800,u:12,w:16,v:12 | grep GFLOPS >> tmp.dat
   echo camb-acvwub-wmuv 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,v,w,u,b w,m,u,v c,a,m,b a:16,c:16,b:12,m:1800,u:12,w:16,v:12 | grep GFLOPS >> tmp.dat
   echo cnamb-bacwuv-wvmnu 3072 2160 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,w,u,v w,v,m,n,u c,n,a,m,b a:12,c:16,b:16,m:48,n:45,u:12,w:16,v:12 | grep GFLOPS >> tmp.dat
   echo mbnca-wvmnu-bacwuv 1800 2304 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,v,m,n,u b,a,c,w,u,v m,b,n,c,a a:12,c:12,b:16,m:40,n:45,u:12,w:16,v:12 | grep GFLOPS >> tmp.dat
   echo amcnb-bacwuv-mwvnu 3072 1800 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,w,u,v m,w,v,n,u a,m,c,n,b a:16,c:12,b:16,m:40,n:45,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo ncabm-mwvnu-bacwuv 1920 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,w,v,n,u b,a,c,w,u,v n,c,a,b,m a:12,c:12,b:16,m:48,n:40,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo conbma-avucwb-munwov 3072 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,c,w,b m,u,n,w,o,v c,o,n,b,m,a a:16,c:16,b:12,m:16,o:12,n:12,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo ambcon-avucwb-munwov 2304 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,c,w,b m,u,n,w,o,v a,m,b,c,o,n a:16,c:12,b:12,m:16,o:12,n:12,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo nmcoab-owunvm-avucwb 3072 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,w,u,n,v,m a,v,u,c,w,b n,m,c,o,a,b a:16,c:12,b:12,m:12,o:16,n:16,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo nocamb-owunvm-avucwb 3072 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,w,u,n,v,m a,v,u,c,w,b n,o,c,a,m,b a:16,c:12,b:12,m:12,o:16,n:16,u:12,w:12,v:12 | grep GFLOPS >> tmp.dat
   echo anm-au-umn 192 36864 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u u,m,n a,n,m a:192,m:192,u:192,n:192 | grep GFLOPS >> tmp.dat
   echo man-umn-au 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n a,u m,a,n a:192,m:192,u:192,n:192 | grep GFLOPS >> tmp.dat
   echo nam-mnu-au 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,u n,a,m a:192,u:192,m:192,n:192 | grep GFLOPS >> tmp.dat
   echo man-mnu-au 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,u m,a,n a:192,u:192,m:192,n:192 | grep GFLOPS >> tmp.dat
   echo amno-ua-muon 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a m,u,o,n a,m,n,o a:48,u:48,m:48,o:50,n:50 | grep GFLOPS >> tmp.dat
   echo aomn-ua-muon 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a m,u,o,n a,o,m,n a:48,u:48,m:48,o:50,n:50 | grep GFLOPS >> tmp.dat
   echo aomn-ua-noum 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a n,o,u,m a,o,m,n a:48,m:50,u:48,o:50,n:48 | grep GFLOPS >> tmp.dat
   echo amon-ua-noum 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a n,o,u,m a,m,o,n a:48,m:50,u:48,o:50,n:48 | grep GFLOPS >> tmp.dat
   echo pmoan-oumnp-au 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,m,n,p a,u p,m,o,a,n a:16,m:24,o:24,n:24,p:24,u:24 | grep GFLOPS >> tmp.dat
   echo apnom-au-oumnp 24 331776 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u o,u,m,n,p a,p,n,o,m a:24,m:24,o:24,n:24,p:24,u:24 | grep GFLOPS >> tmp.dat
   echo npmao-nmuop-au 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u,o,p a,u n,p,m,a,o a:16,m:24,o:24,n:24,p:24,u:24 | grep GFLOPS >> tmp.dat
   echo nompa-nmuop-au 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u,o,p a,u n,o,m,p,a a:16,m:24,o:24,n:24,p:24,u:24 | grep GFLOPS >> tmp.dat
   echo oqpman-muopqn-au 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,p,q,n a,u o,q,p,m,a,n a:16,m:16,o:16,n:15,q:15,p:15,u:15 | grep GFLOPS >> tmp.dat
   echo mponaq-muopqn-au 810000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,p,q,n a,u m,p,o,n,a,q a:16,m:16,o:15,n:15,q:15,p:15,u:15 | grep GFLOPS >> tmp.dat
   echo qpmano-qompun-au 810000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py q,o,m,p,u,n a,u q,p,m,a,n,o a:16,m:15,o:15,n:15,q:16,p:15,u:15 | grep GFLOPS >> tmp.dat
   echo maqnop-qompun-au 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py q,o,m,p,u,n a,u m,a,q,n,o,p a:16,m:16,o:15,n:15,q:16,p:15,u:15 | grep GFLOPS >> tmp.dat
   echo bma-uab-mu 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b m,u b,m,a a:192,m:192,b:192,u:192 | grep GFLOPS >> tmp.dat
   echo mba-mu-uab 192 36864 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u u,a,b m,b,a a:192,m:192,b:192,u:192 | grep GFLOPS >> tmp.dat
   echo bma-uab-um 36864 180 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b u,m b,m,a a:192,m:180,b:192,u:192 | grep GFLOPS >> tmp.dat
   echo amb-uab-um 36864 180 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b u,m a,m,b a:192,m:180,b:192,u:192 | grep GFLOPS >> tmp.dat
   echo abmn-aub-nmu 2400 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b n,m,u a,b,m,n a:48,u:2500,b:50,m:50,n:48 | grep GFLOPS >> tmp.dat
   echo amnb-aub-nmu 2400 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b n,m,u a,m,n,b a:48,u:2500,b:50,m:50,n:48 | grep GFLOPS >> tmp.dat
   echo nbam-mnu-aub 2304 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,u,b n,b,a,m a:48,u:2500,b:50,m:48,n:48 | grep GFLOPS >> tmp.dat
   echo nmba-mnu-aub 2304 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,u,b n,m,b,a a:48,u:2500,b:50,m:48,n:48 | grep GFLOPS >> tmp.dat
   echo am-auv-vum 192 180 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v v,u,m a,m a:192,m:180,u:192,v:192 | grep GFLOPS >> tmp.dat
   echo ma-vum-auv 192 192 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m a,u,v m,a a:192,m:192,u:192,v:192 | grep GFLOPS >> tmp.dat
   echo ma-mvu-auv 192 192 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u a,u,v m,a a:192,u:192,m:192,v:192 | grep GFLOPS >> tmp.dat
   echo am-auv-mvu 192 192 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v m,v,u a,m a:192,m:192,u:192,v:192 | grep GFLOPS >> tmp.dat
   echo manbo-monu-uab 13824 576 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,n,u u,a,b m,a,n,b,o a:24,b:24,m:24,o:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo aombn-uab-monu 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b m,o,n,u a,o,m,b,n a:24,b:24,m:24,o:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo nmbao-nuom-uab 13824 576 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,o,m u,a,b n,m,b,a,o a:24,b:24,m:24,o:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo anobm-uab-nuom 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b n,u,o,m a,n,o,b,m a:24,b:24,m:24,o:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo amn-uav-nuvm 2592 2400 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v n,u,v,m a,m,n a:2592,m:50,v:50,u:48,n:48 | grep GFLOPS >> tmp.dat
   echo man-nuvm-uav 2304 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,v,m u,a,v m,a,n a:2500,m:48,v:50,u:48,n:48 | grep GFLOPS >> tmp.dat
   echo anm-uav-vnum 2592 2500 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v v,n,u,m a,n,m a:2592,m:50,n:50,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo amn-uav-vnum 2592 2500 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v v,n,u,m a,m,n a:2592,m:50,n:50,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo bmnoap-abu-monpu 384 54000 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u m,o,n,p,u b,m,n,o,a,p a:24,b:16,m:16,o:15,n:15,p:15,u:162 | grep GFLOPS >> tmp.dat
   echo pnbaom-monpu-abu 57600 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,n,p,u a,b,u p,n,b,a,o,m a:16,b:15,m:16,o:15,n:15,p:16,u:162 | grep GFLOPS >> tmp.dat
   echo obmnap-unmop-abu 54000 240 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,o,p a,b,u o,b,m,n,a,p a:16,b:15,m:15,o:16,n:15,p:15,u:160 | grep GFLOPS >> tmp.dat
   echo mbonpa-unmop-abu 54000 240 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,o,p a,b,u m,b,o,n,p,a a:16,b:15,m:16,o:15,n:15,p:15,u:160 | grep GFLOPS >> tmp.dat
   echo moan-mvnou-vua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,n,o,u v,u,a m,o,a,n a:480,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo anmo-vua-mvnou 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a m,v,n,o,u a,n,m,o a:480,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo mnoa-nvmuo-vua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,m,u,o v,u,a m,n,o,a a:480,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo namo-nvmuo-vua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,m,u,o v,u,a n,a,m,o a:480,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo npoam-onmpvu-auv 57600 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,m,p,v,u a,u,v n,p,o,a,m a:160,m:15,o:16,n:16,p:15,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo oanpm-onmpvu-auv 54000 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,m,p,v,u a,u,v o,a,n,p,m a:160,m:15,o:16,n:15,p:15,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo anomp-auv-mounpv 144 54000 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v m,o,u,n,p,v a,n,o,m,p a:144,m:16,o:15,n:15,p:15,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo pamno-mounpv-auv 57600 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,u,n,p,v a,u,v p,a,m,n,o a:160,m:16,o:15,n:15,p:16,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo mbca-um-cbau 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m c,b,a,u m,b,c,a a:50,m:48,c:48,b:50,u:48 | grep GFLOPS >> tmp.dat
   echo mcab-um-cbau 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m c,b,a,u m,c,a,b a:50,m:48,c:48,b:50,u:48 | grep GFLOPS >> tmp.dat
   echo cabm-cbau-mu 120000 48 50 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,a,u m,u c,a,b,m a:50,m:48,c:48,b:50,u:50 | grep GFLOPS >> tmp.dat
   echo bmac-cbau-mu 115200 48 50 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,a,u m,u b,m,a,c a:50,m:48,c:48,b:48,u:50 | grep GFLOPS >> tmp.dat
   echo mabnc-nmu-aucb 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u,c,b m,a,b,n,c a:24,c:24,b:24,m:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo mbnac-nmu-aucb 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u,c,b m,b,n,a,c a:24,c:24,b:24,m:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo acmbn-aucb-umn 13824 576 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,c,b u,m,n a,c,m,b,n a:24,c:24,b:24,m:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo mcabn-umn-aucb 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n a,u,c,b m,c,a,b,n a:24,c:24,b:24,m:24,n:24,u:480 | grep GFLOPS >> tmp.dat
   echo abm-aubv-mvu 2400 2560 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v m,v,u a,b,m a:48,m:2560,b:50,u:50,v:50 | grep GFLOPS >> tmp.dat
   echo bma-aubv-mvu 2304 2560 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v m,v,u b,m,a a:48,m:2560,b:48,u:50,v:50 | grep GFLOPS >> tmp.dat
   echo bam-aubv-vmu 2304 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v v,m,u b,a,m a:48,m:2500,b:48,u:50,v:48 | grep GFLOPS >> tmp.dat
   echo amb-aubv-vmu 2400 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v v,m,u a,m,b a:48,m:2500,b:50,u:50,v:48 | grep GFLOPS >> tmp.dat
   echo mobanc-umno-acbu 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,o a,c,b,u m,o,b,a,n,c a:16,c:15,b:15,m:16,o:15,n:15,u:2400 | grep GFLOPS >> tmp.dat
   echo ombnca-umno-acbu 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,o a,c,b,u o,m,b,n,c,a a:16,c:15,b:15,m:15,o:16,n:15,u:2400 | grep GFLOPS >> tmp.dat
   echo ocanbm-umon-acbu 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,o,n a,c,b,u o,c,a,n,b,m a:16,c:15,b:15,m:15,o:16,n:15,u:2400 | grep GFLOPS >> tmp.dat
   echo ambnco-acbu-umon 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,b,u u,m,o,n a,m,b,n,c,o a:16,c:15,b:15,m:16,o:15,n:15,u:2400 | grep GFLOPS >> tmp.dat
   echo abmn-avub-unvm 2400 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,b u,n,v,m a,b,m,n a:48,b:50,m:50,n:50,u:48,v:50 | grep GFLOPS >> tmp.dat
   echo nabm-unvm-avub 2400 2400 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,v,m a,v,u,b n,a,b,m a:48,b:50,m:50,n:48,u:48,v:50 | grep GFLOPS >> tmp.dat
   echo mnab-nuvm-avub 2304 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,v,m a,v,u,b m,n,a,b a:48,b:50,m:48,n:48,u:50,v:50 | grep GFLOPS >> tmp.dat
   echo abmn-avub-nuvm 2400 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,b n,u,v,m a,b,m,n a:48,b:50,m:50,n:48,u:50,v:50 | grep GFLOPS >> tmp.dat
   echo am-vwua-mvuw 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,u,a m,v,u,w a,m a:48,m:48,u:50,w:50,v:48 | grep GFLOPS >> tmp.dat
   echo am-vwua-muwv 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,u,a m,u,w,v a,m a:48,m:48,u:50,w:50,v:48 | grep GFLOPS >> tmp.dat
   echo am-vwua-mwvu 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,u,a m,w,v,u a,m a:48,m:48,u:50,w:50,v:48 | grep GFLOPS >> tmp.dat
   echo am-uvwa-mvuw 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a m,v,u,w a,m a:48,m:48,u:48,w:50,v:50 | grep GFLOPS >> tmp.dat
   echo am-uvwa-muwv 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a m,u,w,v a,m a:48,m:48,u:48,w:50,v:50 | grep GFLOPS >> tmp.dat
   echo am-uvwa-mwvu 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a m,w,v,u a,m a:48,m:48,u:48,w:50,v:50 | grep GFLOPS >> tmp.dat
   echo anomb-bvua-numov 576 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,u,a n,u,m,o,v a,n,o,m,b a:24,b:24,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo bomna-bvua-numov 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,u,a n,u,m,o,v b,o,m,n,a a:20,b:24,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo nmbao-ovmnu-bvua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,m,n,u b,v,u,a n,m,b,a,o a:20,b:24,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo naobm-ovmnu-bvua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,m,n,u b,v,u,a n,a,o,b,m a:20,b:24,m:24,o:24,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo amn-awvu-wmuvn 480 576 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,w,v,u w,m,u,v,n a,m,n a:480,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo man-wmuvn-awvu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,u,v,n a,w,v,u m,a,n a:480,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo man-unwmv-awvu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,w,m,v a,w,v,u m,a,n a:480,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo nma-unwmv-awvu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,w,m,v a,w,v,u n,m,a a:480,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo naobpm-pnvomu-aubv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,n,v,o,m,u a,u,b,v n,a,o,b,p,m a:16,b:15,m:15,o:15,n:16,p:16,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo bamnpo-aubv-pnvomu 384 54000 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v p,n,v,o,m,u b,a,m,n,p,o a:24,b:16,m:15,o:15,n:15,p:16,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo pomabn-nvuopm-aubv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,o,p,m a,u,b,v p,o,m,a,b,n a:16,b:15,m:15,o:15,n:16,p:16,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo pobmna-nvuopm-aubv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,o,p,m a,u,b,v p,o,b,m,n,a a:16,b:15,m:15,o:15,n:16,p:16,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo aomn-vwua-nmuwov 2400 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,u,a n,m,u,w,o,v a,o,m,n a:2400,m:15,o:15,n:16,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo onam-nmuwov-vwua 3840 2400 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u,w,o,v v,w,u,a o,n,a,m a:2400,m:15,o:16,n:16,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo amon-vwua-uvnomw 2400 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,u,a u,v,n,o,m,w a,m,o,n a:2400,m:16,o:15,n:15,u:16,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo mnao-uvnomw-vwua 3600 2400 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,n,o,m,w v,w,u,a m,n,a,o a:2400,m:16,o:15,n:15,u:16,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo dmabc-budac-mu 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c m,u d,m,a,b,c a:24,c:24,b:24,d:24,m:16,u:24 | grep GFLOPS >> tmp.dat
   echo amcbd-budac-mu 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c m,u a,m,c,b,d a:24,c:24,b:24,d:24,m:16,u:24 | grep GFLOPS >> tmp.dat
   echo amdbc-budac-um 331776 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c u,m a,m,d,b,c a:24,c:24,b:24,d:24,m:20,u:24 | grep GFLOPS >> tmp.dat
   echo ambcd-budac-um 331776 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c u,m a,m,b,c,d a:24,c:24,b:24,d:24,m:20,u:24 | grep GFLOPS >> tmp.dat
   echo bmcand-budac-mun 54000 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c m,u,n b,m,c,a,n,d a:15,c:15,b:16,d:15,m:16,n:15,u:162 | grep GFLOPS >> tmp.dat
   echo bcandm-budac-mun 54000 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c m,u,n b,c,a,n,d,m a:15,c:15,b:16,d:15,m:16,n:15,u:162 | grep GFLOPS >> tmp.dat
   echo bmcdna-budac-mnu 54000 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,d,a,c m,n,u b,m,c,d,n,a a:15,c:15,b:16,d:15,m:16,n:15,u:162 | grep GFLOPS >> tmp.dat
   echo ncdmab-mnu-budac 384 54000 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u b,u,d,a,c n,c,d,m,a,b a:15,c:15,b:16,d:15,m:24,n:16,u:162 | grep GFLOPS >> tmp.dat
   echo abcm-cbvau-uvm 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,a,u u,v,m a,b,c,m a:24,c:24,b:24,m:480,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo cmba-cbvau-uvm 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,a,u u,v,m c,m,b,a a:24,c:24,b:24,m:480,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo bmca-cbvau-vmu 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,a,u v,m,u b,m,c,a a:24,c:24,b:24,m:480,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo bacm-cbvau-vmu 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,a,u v,m,u b,a,c,m a:24,c:24,b:24,m:480,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo nacmb-vnmu-vcaub 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u v,c,a,u,b n,a,c,m,b a:24,c:24,b:24,m:20,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo macnb-vnmu-vcaub 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u v,c,a,u,b m,a,c,n,b a:24,c:24,b:24,m:24,n:20,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo nacmb-numv-vcaub 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m,v v,c,a,u,b n,a,c,m,b a:24,c:24,b:24,m:20,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo acnbm-vcaub-numv 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,c,a,u,b n,u,m,v a,c,n,b,m a:24,c:24,b:24,m:20,n:24,u:24,v:24 | grep GFLOPS >> tmp.dat
   echo bam-abvuw-vwmu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u,w v,w,m,u b,a,m a:24,b:24,m:480,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo bma-abvuw-vwmu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u,w v,w,m,u b,m,a a:24,b:24,m:480,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo bma-abvuw-vmwu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,v,u,w v,m,w,u b,m,a a:24,b:24,m:480,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo mba-vmwu-abvuw 480 576 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,w,u a,b,v,u,w m,b,a a:24,b:24,m:480,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo canbom-vubac-ovmnu 3600 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,b,a,c o,v,m,n,u c,a,n,b,o,m a:15,c:16,b:15,m:15,o:16,n:15,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo namobc-ovmnu-vubac 3840 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,m,n,u v,u,b,a,c n,a,m,o,b,c a:16,c:15,b:15,m:15,o:16,n:16,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo cbmoan-vubac-uonvm 3600 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,b,a,c u,o,n,v,m c,b,m,o,a,n a:15,c:16,b:15,m:16,o:15,n:15,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo bmoanc-vubac-uonvm 3600 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,b,a,c u,o,n,v,m b,m,o,a,n,c a:15,c:15,b:16,m:16,o:15,n:15,u:48,v:48 | grep GFLOPS >> tmp.dat
   echo namb-wunvm-vwaub 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,n,v,m v,w,a,u,b n,a,m,b a:20,b:20,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo banm-vwaub-wunvm 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,a,u,b w,u,n,v,m b,a,n,m a:24,b:24,m:20,n:20,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo nbam-vnmuw-vwaub 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u,w v,w,a,u,b n,b,a,m a:20,b:20,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo mnba-vnmuw-vwaub 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u,w v,w,a,u,b m,n,b,a a:20,b:20,m:24,n:24,u:24,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo nbaom-uwvmon-vbwua 3600 2304 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,w,v,m,o,n v,b,w,u,a n,b,a,o,m a:48,b:48,m:15,o:15,n:16,u:16,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo bmano-vbwua-uwvmon 2304 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,w,u,a u,w,v,m,o,n b,m,a,n,o a:48,b:48,m:16,o:15,n:15,u:16,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo mnoab-mownvu-vbwua 3600 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,w,n,v,u v,b,w,u,a m,n,o,a,b a:48,b:48,m:16,o:15,n:15,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo nmboa-mownvu-vbwua 3840 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,w,n,v,u v,b,w,u,a n,m,b,o,a a:48,b:48,m:16,o:15,n:16,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo adbemc-dabuec-um 864000 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py d,a,b,u,e,c u,m a,d,b,e,m,c a:16,c:15,b:15,e:15,d:16,m:12,u:16 | grep GFLOPS >> tmp.dat
   echo dcmeba-dabuec-um 810000 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py d,a,b,u,e,c u,m d,c,m,e,b,a a:15,c:15,b:15,e:15,d:16,m:12,u:16 | grep GFLOPS >> tmp.dat
   echo cmeadb-dabuec-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py d,a,b,u,e,c m,u c,m,e,a,d,b a:15,c:16,b:15,e:15,d:16,m:16,u:15 | grep GFLOPS >> tmp.dat
   echo bmcaed-dabuec-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py d,a,b,u,e,c m,u b,m,c,a,e,d a:15,c:15,b:16,e:15,d:16,m:16,u:15 | grep GFLOPS >> tmp.dat
   echo mdacb-umv-bcvuad 144 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v b,c,v,u,a,d m,d,a,c,b a:15,c:15,b:16,d:15,m:144,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo mdbac-umv-bcvuad 144 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v b,c,v,u,a,d m,d,b,a,c a:15,c:15,b:16,d:15,m:144,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo acmdb-bcvuad-muv 57600 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,u,a,d m,u,v a,c,m,d,b a:16,c:15,b:16,d:15,m:160,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo bdmca-bcvuad-muv 54000 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,u,a,d m,u,v b,d,m,c,a a:15,c:15,b:16,d:15,m:160,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo mcanbd-vmnu-bacdvu 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,n,u b,a,c,d,v,u m,c,a,n,b,d a:15,c:15,b:16,d:15,m:16,n:15,u:15,v:16 | grep GFLOPS >> tmp.dat
   echo dcanbm-bacdvu-vmnu 57600 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,d,v,u v,m,n,u d,c,a,n,b,m a:15,c:15,b:16,d:16,m:16,n:15,u:15,v:16 | grep GFLOPS >> tmp.dat
   echo cambdn-bacdvu-mnuv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,d,v,u m,n,u,v c,a,m,b,d,n a:15,c:16,b:16,d:15,m:16,n:15,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo adnbmc-bacdvu-mnuv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,d,v,u m,n,u,v a,d,n,b,m,c a:16,c:15,b:16,d:15,m:16,n:15,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo bacm-cbvuaw-wmuv 3840 2400 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,u,a,w w,m,u,v b,a,c,m a:15,c:16,b:16,m:2400,u:15,w:16,v:15 | grep GFLOPS >> tmp.dat
   echo bcma-cbvuaw-wmuv 3840 2400 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,u,a,w w,m,u,v b,c,m,a a:15,c:16,b:16,m:2400,u:15,w:16,v:15 | grep GFLOPS >> tmp.dat
   echo mabc-mvwu-cbvuaw 2400 3600 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,w,u c,b,v,u,a,w m,a,b,c a:15,c:16,b:15,m:2400,u:15,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo cmab-cbvuaw-mvwu 3600 2400 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,u,a,w m,v,w,u c,m,a,b a:15,c:16,b:15,m:2400,u:15,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo bnacm-wcaubv-numvw 3600 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,c,a,u,b,v n,u,m,v,w b,n,a,c,m a:15,c:15,b:16,m:48,n:48,u:15,w:16,v:15 | grep GFLOPS >> tmp.dat
   echo bnamc-wcaubv-numvw 3600 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,c,a,u,b,v n,u,m,v,w b,n,a,m,c a:15,c:15,b:16,m:48,n:48,u:15,w:16,v:15 | grep GFLOPS >> tmp.dat
   echo ncmba-vnuwm-wcaubv 2304 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,u,w,m w,c,a,u,b,v n,c,m,b,a a:16,c:15,b:15,m:48,n:48,u:15,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mcnba-vnuwm-wcaubv 2304 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,u,w,m w,c,a,u,b,v m,c,n,b,a a:16,c:15,b:15,m:48,n:48,u:15,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo anmocb-bcawvu-mnouvw 3840 3600 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,a,w,v,u m,n,o,u,v,w a,n,m,o,c,b a:16,c:15,b:16,m:16,o:15,n:15,u:15,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo ancmob-bcawvu-mnouvw 3840 3600 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,a,w,v,u m,n,o,u,v,w a,n,c,m,o,b a:16,c:15,b:16,m:16,o:15,n:15,u:15,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo bmoanc-bcawvu-uonmvw 3600 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,a,w,v,u u,o,n,m,v,w b,m,o,a,n,c a:15,c:15,b:16,m:16,o:15,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo ncomab-uonmvw-bcawvu 3600 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,n,m,v,w b,c,a,w,v,u n,c,o,m,a,b a:15,c:15,b:16,m:15,o:15,n:16,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo anm-au-umn 216 46656 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u u,m,n a,n,m a:216,m:216,u:216,n:216 | grep GFLOPS >> tmp.dat
   echo nma-umn-au 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n a,u n,m,a a:216,m:216,u:216,n:216 | grep GFLOPS >> tmp.dat
   echo nma-mnu-au 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,u n,m,a a:216,u:216,m:216,n:216 | grep GFLOPS >> tmp.dat
   echo nam-mnu-au 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u a,u n,a,m a:216,u:216,m:216,n:216 | grep GFLOPS >> tmp.dat
   echo anmo-ua-muno 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a m,u,n,o a,n,m,o a:72,u:64,m:64,o:54,n:54 | grep GFLOPS >> tmp.dat
   echo aonm-ua-muno 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a m,u,n,o a,o,n,m a:72,u:64,m:64,o:54,n:54 | grep GFLOPS >> tmp.dat
   echo anom-ua-onmu 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a o,n,m,u a,n,o,m a:72,u:64,m:54,o:64,n:54 | grep GFLOPS >> tmp.dat
   echo amno-ua-onmu 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a o,n,m,u a,m,n,o a:72,u:64,m:54,o:64,n:54 | grep GFLOPS >> tmp.dat
   echo pnmao-mnopu-au 360000 24 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,o,p,u a,u p,n,m,a,o a:24,m:24,o:25,n:25,p:24,u:25 | grep GFLOPS >> tmp.dat
   echo pmona-mnopu-au 360000 24 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,o,p,u a,u p,m,o,n,a a:24,m:24,o:25,n:25,p:24,u:25 | grep GFLOPS >> tmp.dat
   echo maopn-monup-au 375000 24 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,o,n,u,p a,u m,a,o,p,n a:24,m:24,o:25,n:25,p:25,u:25 | grep GFLOPS >> tmp.dat
   echo aopnm-au-monup 24 375000 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u m,o,n,u,p a,o,p,n,m a:24,m:24,o:25,n:25,p:25,u:25 | grep GFLOPS >> tmp.dat
   echo mqnoap-ompunq-ua 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,p,u,n,q u,a m,q,n,o,a,p a:16,m:16,o:16,n:15,q:15,p:15,u:16 | grep GFLOPS >> tmp.dat
   echo qpmnao-ompunq-ua 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,p,u,n,q u,a q,p,m,n,a,o a:16,m:15,o:16,n:15,q:16,p:15,u:16 | grep GFLOPS >> tmp.dat
   echo onqpma-upnmqo-ua 810000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,n,m,q,o u,a o,n,q,p,m,a a:16,m:15,o:16,n:15,q:15,p:15,u:16 | grep GFLOPS >> tmp.dat
   echo mnopqa-upnmqo-ua 810000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,p,n,m,q,o u,a m,n,o,p,q,a a:16,m:16,o:15,n:15,q:15,p:15,u:16 | grep GFLOPS >> tmp.dat
   echo bam-aub-um 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b u,m b,a,m a:216,m:216,b:216,u:216 | grep GFLOPS >> tmp.dat
   echo amb-aub-um 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b u,m a,m,b a:216,m:216,b:216,u:216 | grep GFLOPS >> tmp.dat
   echo bma-aub-mu 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b m,u b,m,a a:216,m:216,b:216,u:216 | grep GFLOPS >> tmp.dat
   echo mba-mu-aub 216 46656 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u a,u,b m,b,a a:216,m:216,b:216,u:216 | grep GFLOPS >> tmp.dat
   echo bmna-aub-num 4608 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b n,u,m b,m,n,a a:72,u:3240,b:64,m:54,n:64 | grep GFLOPS >> tmp.dat
   echo mnab-num-aub 4608 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m a,u,b m,n,a,b a:64,u:3240,b:54,m:72,n:64 | grep GFLOPS >> tmp.dat
   echo nbam-nmu-aub 3456 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u,b n,b,a,m a:64,u:3240,b:54,m:54,n:64 | grep GFLOPS >> tmp.dat
   echo bnam-aub-nmu 4608 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b n,m,u b,n,a,m a:72,u:3240,b:64,m:54,n:64 | grep GFLOPS >> tmp.dat
   echo ma-vmu-vua 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u v,u,a m,a a:216,u:216,m:216,v:216 | grep GFLOPS >> tmp.dat
   echo am-vua-vmu 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a v,m,u a,m a:216,m:216,u:216,v:216 | grep GFLOPS >> tmp.dat
   echo am-vua-uvm 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a u,v,m a,m a:216,m:216,u:216,v:216 | grep GFLOPS >> tmp.dat
   echo ma-uvm-vua 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m v,u,a m,a a:216,m:216,u:216,v:216 | grep GFLOPS >> tmp.dat
   echo maobn-mnuo-bua 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o b,u,a m,a,o,b,n a:25,b:24,m:24,o:25,n:25,u:600 | grep GFLOPS >> tmp.dat
   echo nboma-mnuo-bua 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o b,u,a n,b,o,m,a a:25,b:24,m:24,o:25,n:24,u:600 | grep GFLOPS >> tmp.dat
   echo oambn-uonm-bua 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,n,m b,u,a o,a,m,b,n a:25,b:24,m:25,o:24,n:25,u:600 | grep GFLOPS >> tmp.dat
   echo nboma-uonm-bua 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,n,m b,u,a n,b,o,m,a a:25,b:24,m:25,o:25,n:24,u:600 | grep GFLOPS >> tmp.dat
   echo man-mnvu-auv 3456 3240 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u a,u,v m,a,n a:3240,u:54,v:54,m:64,n:54 | grep GFLOPS >> tmp.dat
   echo anm-auv-mnvu 3240 3456 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v m,n,v,u a,n,m a:3240,u:54,v:54,m:64,n:54 | grep GFLOPS >> tmp.dat
   echo mna-vunm-auv 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,n,m a,u,v m,n,a a:3240,m:64,n:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo amn-auv-vunm 3240 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v v,u,n,m a,m,n a:3240,m:54,n:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo manpbo-uopnm-uba 54000 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,p,n,m u,b,a m,a,n,p,b,o a:16,b:15,m:16,o:15,n:15,p:15,u:200 | grep GFLOPS >> tmp.dat
   echo mpobna-uopnm-uba 54000 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,p,n,m u,b,a m,p,o,b,n,a a:16,b:15,m:16,o:15,n:15,p:15,u:200 | grep GFLOPS >> tmp.dat
   echo bonmap-uba-omnpu 240 54000 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a o,m,n,p,u b,o,n,m,a,p a:15,b:16,m:15,o:16,n:15,p:15,u:200 | grep GFLOPS >> tmp.dat
   echo nmbpoa-omnpu-uba 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,n,p,u u,b,a n,m,b,p,o,a a:16,b:15,m:15,o:16,n:16,p:15,u:200 | grep GFLOPS >> tmp.dat
   echo onma-unvom-uva 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,v,o,m u,v,a o,n,m,a a:600,m:25,o:24,n:25,u:24,v:25 | grep GFLOPS >> tmp.dat
   echo noam-unvom-uva 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,v,o,m u,v,a n,o,a,m a:600,m:25,o:25,n:24,u:24,v:25 | grep GFLOPS >> tmp.dat
   echo noam-omunv-uva 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,u,n,v u,v,a n,o,a,m a:600,m:25,o:24,n:24,u:24,v:25 | grep GFLOPS >> tmp.dat
   echo amno-uva-omunv 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a o,m,u,n,v a,m,n,o a:600,m:25,o:24,n:25,u:24,v:25 | grep GFLOPS >> tmp.dat
   echo pnaom-nupvmo-uav 57600 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,p,v,m,o u,a,v p,n,a,o,m a:200,m:15,o:15,n:16,p:16,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo nopma-nupvmo-uav 54000 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,p,v,m,o u,a,v n,o,p,m,a a:200,m:15,o:15,n:16,p:15,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo nmoap-noumvp-uav 54000 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,u,m,v,p u,a,v n,m,o,a,p a:200,m:15,o:15,n:16,p:15,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo mopna-noumvp-uav 57600 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,u,m,v,p u,a,v m,o,p,n,a a:200,m:16,o:15,n:16,p:15,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo acmb-aubc-mu 186624 64 54 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,c m,u a,c,m,b a:64,m:64,c:54,b:54,u:54 | grep GFLOPS >> tmp.dat
   echo camb-aubc-mu 221184 64 54 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,c m,u c,a,m,b a:64,m:64,c:64,b:54,u:54 | grep GFLOPS >> tmp.dat
   echo mcba-um-aubc 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m a,u,b,c m,c,b,a a:64,m:72,c:54,b:54,u:64 | grep GFLOPS >> tmp.dat
   echo mbac-um-aubc 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m a,u,b,c m,b,a,c a:64,m:72,c:54,b:54,u:64 | grep GFLOPS >> tmp.dat
   echo cabmn-bacu-nmu 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u n,m,u c,a,b,m,n a:25,c:24,b:24,m:25,n:24,u:600 | grep GFLOPS >> tmp.dat
   echo bmnca-bacu-nmu 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u n,m,u b,m,n,c,a a:25,c:25,b:24,m:25,n:24,u:600 | grep GFLOPS >> tmp.dat
   echo nbmca-mun-bacu 576 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n b,a,c,u n,b,m,c,a a:25,c:25,b:24,m:24,n:24,u:600 | grep GFLOPS >> tmp.dat
   echo cabnm-bacu-mun 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,u m,u,n c,a,b,n,m a:25,c:24,b:24,m:24,n:25,u:600 | grep GFLOPS >> tmp.dat
   echo amb-auvb-umv 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b u,m,v a,m,b a:64,m:3240,b:54,u:64,v:54 | grep GFLOPS >> tmp.dat
   echo abm-auvb-umv 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b u,m,v a,b,m a:64,m:3240,b:54,u:64,v:54 | grep GFLOPS >> tmp.dat
   echo mba-vum-auvb 3240 3456 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m a,u,v,b m,b,a a:64,m:3240,b:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo amb-auvb-vum 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b v,u,m a,m,b a:64,m:3240,b:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo ocmban-unom-abcu 3600 3600 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,o,m a,b,c,u o,c,m,b,a,n a:16,c:15,b:15,m:15,o:16,n:15,u:3072 | grep GFLOPS >> tmp.dat
   echo ocnbam-unom-abcu 3600 3600 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,o,m a,b,c,u o,c,n,b,a,m a:16,c:15,b:15,m:15,o:16,n:15,u:3072 | grep GFLOPS >> tmp.dat
   echo oacnmb-omun-abcu 3600 3600 3125 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,u,n a,b,c,u o,a,c,n,m,b a:16,c:15,b:15,m:15,o:16,n:15,u:3125 | grep GFLOPS >> tmp.dat
   echo amncob-abcu-omun 3600 3600 3125 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,c,u o,m,u,n a,m,n,c,o,b a:16,c:15,b:15,m:15,o:16,n:15,u:3125 | grep GFLOPS >> tmp.dat
   echo anbm-vuab-vmnu 3456 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b v,m,n,u a,n,b,m a:64,b:54,m:54,n:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo bman-vuab-vmnu 3456 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b v,m,n,u b,m,a,n a:54,b:64,m:54,n:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo anmb-vuab-mnuv 3456 3456 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b m,n,u,v a,n,m,b a:64,b:54,m:64,n:54,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo nbma-mnuv-vuab 4608 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,v v,u,a,b n,b,m,a a:54,b:54,m:72,n:64,u:54,v:64 | grep GFLOPS >> tmp.dat
   echo am-wuva-mvuw 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,v,a m,v,u,w a,m a:72,m:64,u:54,w:64,v:54 | grep GFLOPS >> tmp.dat
   echo am-wuva-mwvu 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,v,a m,w,v,u a,m a:72,m:64,u:54,w:64,v:54 | grep GFLOPS >> tmp.dat
   echo am-wuva-muwv 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,v,a m,u,w,v a,m a:72,m:64,u:54,w:64,v:54 | grep GFLOPS >> tmp.dat
   echo am-uvwa-mwvu 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a m,w,v,u a,m a:72,m:64,u:64,w:54,v:54 | grep GFLOPS >> tmp.dat
   echo am-uvwa-mvuw 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a m,v,u,w a,m a:72,m:64,u:64,w:54,v:54 | grep GFLOPS >> tmp.dat
   echo am-uvwa-muwv 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,a m,u,w,v a,m a:72,m:64,u:64,w:54,v:54 | grep GFLOPS >> tmp.dat
   echo aonmb-vbau-mouvn 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,u m,o,u,v,n a,o,n,m,b a:24,b:25,m:24,o:25,n:25,u:25,v:24 | grep GFLOPS >> tmp.dat
   echo bmnao-vbau-mouvn 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,u m,o,u,v,n b,m,n,a,o a:25,b:24,m:24,o:25,n:25,u:25,v:24 | grep GFLOPS >> tmp.dat
   echo nmboa-vomnu-vbau 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,o,m,n,u v,b,a,u n,m,b,o,a a:24,b:25,m:25,o:25,n:24,u:25,v:24 | grep GFLOPS >> tmp.dat
   echo anobm-vbau-vomnu 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,u v,o,m,n,u a,n,o,b,m a:24,b:25,m:24,o:25,n:25,u:25,v:24 | grep GFLOPS >> tmp.dat
   echo anm-uvaw-vumnw 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,w v,u,m,n,w a,n,m a:600,m:24,n:25,u:24,w:25,v:24 | grep GFLOPS >> tmp.dat
   echo nma-vumnw-uvaw 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m,n,w u,v,a,w n,m,a a:600,m:25,n:24,u:24,w:25,v:24 | grep GFLOPS >> tmp.dat
   echo mna-wvnmu-uvaw 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,v,n,m,u u,v,a,w m,n,a a:600,m:24,n:25,u:24,w:24,v:25 | grep GFLOPS >> tmp.dat
   echo amn-uvaw-wvnmu 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a,w w,v,n,m,u a,m,n a:600,m:24,n:25,u:24,w:24,v:25 | grep GFLOPS >> tmp.dat
   echo mpbnoa-vopmun-vabu 54000 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,o,p,m,u,n v,a,b,u m,p,b,n,o,a a:16,b:15,m:16,o:15,n:15,p:15,u:15,v:16 | grep GFLOPS >> tmp.dat
   echo bnampo-vabu-vopmun 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,b,u v,o,p,m,u,n b,n,a,m,p,o a:15,b:16,m:16,o:15,n:15,p:15,u:15,v:16 | grep GFLOPS >> tmp.dat
   echo baompn-vabu-vpuonm 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,b,u v,p,u,o,n,m b,a,o,m,p,n a:15,b:16,m:16,o:15,n:15,p:15,u:15,v:16 | grep GFLOPS >> tmp.dat
   echo bnoapm-vabu-vpuonm 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,b,u v,p,u,o,n,m b,n,o,a,p,m a:15,b:16,m:16,o:15,n:15,p:15,u:15,v:16 | grep GFLOPS >> tmp.dat
   echo mnoa-onmwvu-uvwa 3840 3072 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,m,w,v,u u,v,w,a m,n,o,a a:3072,m:16,o:16,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo omna-onmwvu-uvwa 3600 3072 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,m,w,v,u u,v,w,a o,m,n,a a:3072,m:15,o:16,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo oamn-vonmwu-uvwa 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,o,n,m,w,u u,v,w,a o,a,m,n a:3072,m:15,o:16,n:15,u:16,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo namo-vonmwu-uvwa 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,o,n,m,w,u u,v,w,a n,a,m,o a:3072,m:15,o:15,n:16,u:16,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo cadbm-bcdua-um 360000 24 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,d,u,a u,m c,a,d,b,m a:25,c:24,b:24,d:25,m:24,u:24 | grep GFLOPS >> tmp.dat
   echo acmdb-bcdua-um 360000 24 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,d,u,a u,m a,c,m,d,b a:24,c:25,b:24,d:25,m:24,u:24 | grep GFLOPS >> tmp.dat
   echo mcadb-mu-bcdua 24 375000 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,c,d,u,a m,c,a,d,b a:25,c:25,b:24,d:25,m:24,u:25 | grep GFLOPS >> tmp.dat
   echo mbadc-mu-bcdua 24 375000 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,c,d,u,a m,b,a,d,c a:25,c:25,b:24,d:25,m:24,u:25 | grep GFLOPS >> tmp.dat
   echo dabmcn-caubd-mun 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b,d m,u,n d,a,b,m,c,n a:15,c:16,b:15,d:16,m:16,n:15,u:200 | grep GFLOPS >> tmp.dat
   echo dabcnm-caubd-mun 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b,d m,u,n d,a,b,c,n,m a:15,c:16,b:15,d:16,m:16,n:15,u:200 | grep GFLOPS >> tmp.dat
   echo mcbnda-unm-caubd 240 54000 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m c,a,u,b,d m,c,b,n,d,a a:15,c:16,b:15,d:15,m:16,n:15,u:200 | grep GFLOPS >> tmp.dat
   echo abncdm-caubd-unm 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b,d u,n,m a,b,n,c,d,m a:16,c:16,b:15,d:15,m:16,n:15,u:200 | grep GFLOPS >> tmp.dat
   echo cbma-cabuv-vmu 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,u,v v,m,u c,b,m,a a:25,c:24,b:25,m:600,u:25,v:24 | grep GFLOPS >> tmp.dat
   echo cmba-cabuv-vmu 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,u,v v,m,u c,m,b,a a:25,c:24,b:25,m:600,u:25,v:24 | grep GFLOPS >> tmp.dat
   echo macb-umv-cabuv 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v c,a,b,u,v m,a,c,b a:25,c:24,b:25,m:600,u:24,v:25 | grep GFLOPS >> tmp.dat
   echo amcb-cabuv-umv 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,u,v u,m,v a,m,c,b a:24,c:24,b:25,m:600,u:24,v:25 | grep GFLOPS >> tmp.dat
   echo mbacn-nvum-cbuva 576 15000 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,m c,b,u,v,a m,b,a,c,n a:25,c:24,b:25,m:24,n:24,u:25,v:25 | grep GFLOPS >> tmp.dat
   echo bcanm-cbuva-nvum 14400 600 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,v,a n,v,u,m b,c,a,n,m a:25,c:24,b:24,m:25,n:24,u:25,v:25 | grep GFLOPS >> tmp.dat
   echo bmcan-cbuva-nvmu 14400 600 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,u,v,a n,v,m,u b,m,c,a,n a:25,c:24,b:24,m:25,n:24,u:25,v:25 | grep GFLOPS >> tmp.dat
   echo nmcab-nvmu-cbuva 600 15000 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,m,u c,b,u,v,a n,m,c,a,b a:25,c:24,b:25,m:25,n:24,u:25,v:25 | grep GFLOPS >> tmp.dat
   echo bma-avwbu-wumv 576 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,w,b,u w,u,m,v b,m,a a:24,b:24,m:600,u:25,w:24,v:25 | grep GFLOPS >> tmp.dat
   echo bam-avwbu-wumv 576 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,w,b,u w,u,m,v b,a,m a:24,b:24,m:600,u:25,w:24,v:25 | grep GFLOPS >> tmp.dat
   echo bam-avwbu-vmuw 576 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,w,b,u v,m,u,w b,a,m a:24,b:24,m:600,u:25,w:25,v:24 | grep GFLOPS >> tmp.dat
   echo mba-vmuw-avwbu 600 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u,w a,v,w,b,u m,b,a a:24,b:25,m:600,u:25,w:25,v:24 | grep GFLOPS >> tmp.dat
   echo cmabno-cbvua-muvon 3600 3600 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,u,a m,u,v,o,n c,m,a,b,n,o a:15,c:16,b:15,m:16,o:15,n:15,u:54,v:54 | grep GFLOPS >> tmp.dat
   echo obcnma-muvon-cbvua 3840 3600 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v,o,n c,b,v,u,a o,b,c,n,m,a a:15,c:16,b:15,m:16,o:16,n:15,u:54,v:54 | grep GFLOPS >> tmp.dat
   echo obnacm-vnomu-cbvua 3600 3600 2592 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,o,m,u c,b,v,u,a o,b,n,a,c,m a:15,c:16,b:15,m:15,o:16,n:15,u:54,v:48 | grep GFLOPS >> tmp.dat
   echo bncmoa-cbvua-vnomu 3840 3600 2592 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,v,u,a v,n,o,m,u b,n,c,m,o,a a:15,c:16,b:16,m:16,o:15,n:15,u:54,v:48 | grep GFLOPS >> tmp.dat
   echo nmba-mnwuv-buwva 576 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,w,u,v b,u,w,v,a n,m,b,a a:25,b:24,m:24,n:24,u:25,w:25,v:25 | grep GFLOPS >> tmp.dat
   echo namb-mnwuv-buwva 576 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,w,u,v b,u,w,v,a n,a,m,b a:25,b:24,m:24,n:24,u:25,w:25,v:25 | grep GFLOPS >> tmp.dat
   echo anmb-buwva-mvnwu 576 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,w,v,a m,v,n,w,u a,n,m,b a:24,b:24,m:24,n:25,u:25,w:25,v:25 | grep GFLOPS >> tmp.dat
   echo manb-mvnwu-buwva 600 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,n,w,u b,u,w,v,a m,a,n,b a:25,b:24,m:24,n:25,u:25,w:25,v:25 | grep GFLOPS >> tmp.dat
   echo bamon-ubwva-mnuvow 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,w,v,a m,n,u,v,o,w b,a,m,o,n a:54,b:48,m:16,o:15,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo anomb-ubwva-mnuvow 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,w,v,a m,n,u,v,o,w a,n,o,m,b a:48,b:54,m:16,o:15,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo bmano-ubwva-uvwomn 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,w,v,a u,v,w,o,m,n b,m,a,n,o a:54,b:48,m:16,o:15,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo aonbm-ubwva-uvwomn 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,w,v,a u,v,w,o,m,n a,o,n,b,m a:48,b:54,m:16,o:15,n:15,u:16,w:15,v:15 | grep GFLOPS >> tmp.dat
   echo bmedac-cabdeu-um 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,d,e,u u,m b,m,e,d,a,c a:15,c:16,b:16,e:15,d:15,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo aedmbc-cabdeu-um 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,d,e,u u,m a,e,d,m,b,c a:16,c:16,b:15,e:15,d:15,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo becdam-cabdeu-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,d,e,u m,u b,e,c,d,a,m a:15,c:16,b:16,e:15,d:15,m:16,u:15 | grep GFLOPS >> tmp.dat
   echo eadbcm-cabdeu-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,b,d,e,u m,u e,a,d,b,c,m a:15,c:16,b:15,e:16,d:15,m:16,u:15 | grep GFLOPS >> tmp.dat
   echo abdcm-cbaudv-muv 57600 200 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,a,u,d,v m,u,v a,b,d,c,m a:16,c:16,b:15,d:15,m:200,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo dabcm-cbaudv-muv 57600 200 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,a,u,d,v m,u,v d,a,b,c,m a:15,c:16,b:15,d:16,m:200,u:15,v:15 | grep GFLOPS >> tmp.dat
   echo mbcda-umv-cbaudv 192 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v c,b,a,u,d,v m,b,c,d,a a:15,c:16,b:15,d:15,m:192,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo bdmca-cbaudv-umv 57600 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,b,a,u,d,v u,m,v b,d,m,c,a a:15,c:16,b:16,d:15,m:200,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo abnmdc-ubvcad-vmnu 54000 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,a,d v,m,n,u a,b,n,m,d,c a:16,c:15,b:15,d:15,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo dabmcn-ubvcad-vmnu 54000 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,a,d v,m,n,u d,a,b,m,c,n a:15,c:15,b:15,d:16,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo anmbcd-ubvcad-mnvu 54000 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,a,d m,n,v,u a,n,m,b,c,d a:16,c:15,b:15,d:15,m:16,n:15,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo cdmban-ubvcad-mnvu 54000 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,v,c,a,d m,n,v,u c,d,m,b,a,n a:15,c:16,b:15,d:15,m:16,n:15,u:16,v:15 | grep GFLOPS >> tmp.dat
   echo bacm-wavcbu-vmwu 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,a,v,c,b,u v,m,w,u b,a,c,m a:15,c:15,b:16,m:3072,u:15,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo camb-wavcbu-vmwu 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,a,v,c,b,u v,m,w,u c,a,m,b a:15,c:16,b:15,m:3072,u:15,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo cabm-wavcbu-muwv 3600 3072 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,a,v,c,b,u m,u,w,v c,a,b,m a:15,c:16,b:15,m:3072,u:15,w:16,v:15 | grep GFLOPS >> tmp.dat
   echo mcab-muwv-wavcbu 3072 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,w,v w,a,v,c,b,u m,c,a,b a:16,c:15,b:15,m:3072,u:15,w:16,v:15 | grep GFLOPS >> tmp.dat
   echo cbnma-vwcuab-vunwm 3600 2916 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,c,u,a,b v,u,n,w,m c,b,n,m,a a:15,c:16,b:15,m:54,n:54,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo namcb-vunwm-vwcuab 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,n,w,m v,w,c,u,a,b n,a,m,c,b a:16,c:15,b:15,m:54,n:48,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo cmbna-vwcuab-nwvmu 3600 2592 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,c,u,a,b n,w,v,m,u c,m,b,n,a a:15,c:16,b:15,m:54,n:48,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo canbm-vwcuab-nwvmu 3600 2592 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,c,u,a,b n,w,v,m,u c,a,n,b,m a:15,c:16,b:15,m:54,n:48,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo cmnboa-vwbuca-wnvmuo 3600 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,b,u,c,a w,n,v,m,u,o c,m,n,b,o,a a:15,c:16,b:15,m:16,o:15,n:15,u:15,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo conbma-vwbuca-wnvmuo 3600 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,b,u,c,a w,n,v,m,u,o c,o,n,b,m,a a:15,c:16,b:15,m:16,o:15,n:15,u:15,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo ncbamo-mwnuvo-vwbuca 3840 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,w,n,u,v,o v,w,b,u,c,a n,c,b,a,m,o a:16,c:15,b:15,m:16,o:15,n:16,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo cbonam-vwbuca-mwnuvo 3600 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,b,u,c,a m,w,n,u,v,o c,b,o,n,a,m a:15,c:16,b:15,m:16,o:15,n:15,u:15,w:15,v:16 | grep GFLOPS >> tmp.dat
   echo mna-num-ua 61440 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m u,a m,n,a a:256,m:240,u:256,n:256 | grep GFLOPS >> tmp.dat
   echo amn-ua-num 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a n,u,m a,m,n a:240,m:256,u:256,n:256 | grep GFLOPS >> tmp.dat
   echo anm-ua-mnu 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a m,n,u a,n,m a:240,u:256,m:256,n:256 | grep GFLOPS >> tmp.dat
   echo man-mnu-ua 62208 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u u,a m,a,n a:256,u:256,m:256,n:243 | grep GFLOPS >> tmp.dat
   echo oanm-unom-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,o,m u,a o,a,n,m a:64,m:60,u:64,o:64,n:64 | grep GFLOPS >> tmp.dat
   echo namo-unom-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,o,m u,a n,a,m,o a:64,m:60,u:64,o:64,n:64 | grep GFLOPS >> tmp.dat
   echo noam-mnuo-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o u,a n,o,a,m a:64,u:64,m:64,o:60,n:64 | grep GFLOPS >> tmp.dat
   echo noma-mnuo-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,o u,a n,o,m,a a:64,u:64,m:64,o:60,n:64 | grep GFLOPS >> tmp.dat
   echo panmo-mpoun-au 419904 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,p,o,u,n a,u p,a,n,m,o a:24,m:24,o:27,n:27,p:24,u:27 | grep GFLOPS >> tmp.dat
   echo maopn-mpoun-au 472392 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,p,o,u,n a,u m,a,o,p,n a:24,m:24,o:27,n:27,p:27,u:27 | grep GFLOPS >> tmp.dat
   echo npmao-nuomp-au 472392 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,o,m,p a,u n,p,m,a,o a:24,m:27,o:27,n:24,p:27,u:27 | grep GFLOPS >> tmp.dat
   echo poanm-nuomp-au 419904 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,o,m,p a,u p,o,a,n,m a:24,m:27,o:27,n:24,p:24,u:27 | grep GFLOPS >> tmp.dat
   echo pqaonm-qnoupm-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py q,n,o,u,p,m a,u p,q,a,o,n,m a:16,m:15,o:16,n:16,q:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo qpanmo-qnoupm-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py q,n,o,u,p,m a,u q,p,a,n,m,o a:16,m:15,o:16,n:16,q:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo mqpano-pqmuon-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,q,m,u,o,n a,u m,q,p,a,n,o a:16,m:16,o:15,n:16,q:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo pnmoaq-pqmuon-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,q,m,u,o,n a,u p,n,m,o,a,q a:16,m:15,o:16,n:16,q:16,p:16,u:16 | grep GFLOPS >> tmp.dat
   echo mba-um-uab 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m u,a,b m,b,a a:256,m:240,b:256,u:256 | grep GFLOPS >> tmp.dat
   echo bma-uab-um 62208 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b u,m b,m,a a:243,m:256,b:256,u:256 | grep GFLOPS >> tmp.dat
   echo amb-uab-mu 62208 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b m,u a,m,b a:256,m:256,b:243,u:256 | grep GFLOPS >> tmp.dat
   echo mba-mu-uab 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u u,a,b m,b,a a:256,m:240,b:256,u:256 | grep GFLOPS >> tmp.dat
   echo bnma-bau-umn 3840 4096 4000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,u u,m,n b,n,m,a a:60,u:4000,b:64,m:64,n:64 | grep GFLOPS >> tmp.dat
   echo mabn-umn-bau 3840 4096 4000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n b,a,u m,a,b,n a:64,u:4000,b:64,m:64,n:60 | grep GFLOPS >> tmp.dat
   echo mbna-num-bau 4608 4096 4050 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m b,a,u m,b,n,a a:64,u:4050,b:64,m:72,n:64 | grep GFLOPS >> tmp.dat
   echo mabn-num-bau 4608 4096 4050 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m b,a,u m,a,b,n a:64,u:4050,b:64,m:72,n:64 | grep GFLOPS >> tmp.dat
   echo am-uva-vmu 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a v,m,u a,m a:240,m:256,u:256,v:256 | grep GFLOPS >> tmp.dat
   echo ma-vmu-uva 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u u,v,a m,a a:256,u:256,m:240,v:256 | grep GFLOPS >> tmp.dat
   echo am-uva-vum 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a v,u,m a,m a:240,m:256,u:256,v:256 | grep GFLOPS >> tmp.dat
   echo ma-vum-uva 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m u,v,a m,a a:256,m:240,u:256,v:256 | grep GFLOPS >> tmp.dat
   echo aobmn-uba-muno 648 17496 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a m,u,n,o a,o,b,m,n a:24,b:27,m:24,o:27,n:27,u:768 | grep GFLOPS >> tmp.dat
   echo omabn-muno-uba 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n,o u,b,a o,m,a,b,n a:24,b:27,m:24,o:24,n:27,u:768 | grep GFLOPS >> tmp.dat
   echo ambon-uba-nuom 648 17496 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a n,u,o,m a,m,b,o,n a:24,b:27,m:27,o:27,n:24,u:768 | grep GFLOPS >> tmp.dat
   echo mnoab-nuom-uba 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,o,m u,b,a m,n,o,a,b a:24,b:27,m:24,o:27,n:24,u:768 | grep GFLOPS >> tmp.dat
   echo anm-avu-mnuv 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u m,n,u,v a,n,m a:3888,u:64,v:64,m:64,n:64 | grep GFLOPS >> tmp.dat
   echo nma-mnuv-avu 4608 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u,v a,v,u n,m,a a:4000,u:64,v:64,m:72,n:64 | grep GFLOPS >> tmp.dat
   echo mna-munv-avu 3840 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n,v a,v,u m,n,a a:4000,u:64,v:64,m:64,n:60 | grep GFLOPS >> tmp.dat
   echo amn-avu-munv 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u m,u,n,v a,m,n a:3888,u:64,v:64,m:64,n:64 | grep GFLOPS >> tmp.dat
   echo nmbpao-pmoun-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,m,o,u,n b,u,a n,m,b,p,a,o a:16,b:16,m:15,o:16,n:16,p:16,u:200 | grep GFLOPS >> tmp.dat
   echo opbman-pmoun-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,m,o,u,n b,u,a o,p,b,m,a,n a:16,b:16,m:15,o:16,n:16,p:16,u:200 | grep GFLOPS >> tmp.dat
   echo pnomba-nmpou-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,p,o,u b,u,a p,n,o,m,b,a a:16,b:16,m:15,o:16,n:16,p:16,u:200 | grep GFLOPS >> tmp.dat
   echo napbom-nmpou-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,p,o,u b,u,a n,a,p,b,o,m a:16,b:16,m:15,o:16,n:16,p:16,u:200 | grep GFLOPS >> tmp.dat
   echo oanm-ovnum-uav 17496 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,n,u,m u,a,v o,a,n,m a:768,m:27,o:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo noam-ovnum-uav 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,n,u,m u,a,v n,o,a,m a:768,m:27,o:24,n:24,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo oman-mvuno-uav 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,n,o u,a,v o,m,a,n a:768,m:24,o:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo naom-mvuno-uav 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,n,o u,a,v n,a,o,m a:768,m:24,o:27,n:24,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo pnoam-umnpvo-avu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n,p,v,o a,v,u p,n,o,a,m a:200,m:15,o:16,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo anopm-avu-umnpvo 192 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u u,m,n,p,v,o a,n,o,p,m a:192,m:16,o:16,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo opnam-pomnuv-avu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,o,m,n,u,v a,v,u o,p,n,a,m a:200,m:15,o:16,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo maonp-pomnuv-avu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,o,m,n,u,v a,v,u m,a,o,n,p a:200,m:16,o:15,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo abmc-buca-mu 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,c,a m,u a,b,m,c a:64,m:64,c:60,b:64,u:64 | grep GFLOPS >> tmp.dat
   echo bcma-buca-mu 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,c,a m,u b,c,m,a a:60,m:64,c:64,b:64,u:64 | grep GFLOPS >> tmp.dat
   echo macb-um-buca 72 262144 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m b,u,c,a m,a,c,b a:64,m:72,c:64,b:64,u:64 | grep GFLOPS >> tmp.dat
   echo acmb-buca-um 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,c,a u,m a,c,m,b a:64,m:64,c:60,b:64,u:64 | grep GFLOPS >> tmp.dat
   echo bcman-buca-num 17496 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,c,a n,u,m b,c,m,a,n a:27,c:27,b:24,m:27,n:24,u:768 | grep GFLOPS >> tmp.dat
   echo nmcba-num-buca 648 17496 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m b,u,c,a n,m,c,b,a a:27,c:27,b:24,m:27,n:24,u:768 | grep GFLOPS >> tmp.dat
   echo ancmb-buca-mnu 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,c,a m,n,u a,n,c,m,b a:24,c:27,b:24,m:24,n:27,u:768 | grep GFLOPS >> tmp.dat
   echo anbmc-buca-mnu 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,c,a m,n,u a,n,b,m,c a:24,c:27,b:24,m:24,n:27,u:768 | grep GFLOPS >> tmp.dat
   echo mab-vmu-uvba 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u u,v,b,a m,a,b a:64,m:3888,b:64,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo mab-vum-uvba 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m u,v,b,a m,a,b a:64,m:3888,b:64,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo mab-umv-uvba 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v u,v,b,a m,a,b a:64,m:3888,b:64,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo bma-uvba-mvu 3840 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,b,a m,v,u b,m,a a:60,m:4000,b:64,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo amb-uvba-mvu 3840 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,b,a m,v,u a,m,b a:64,m:4000,b:60,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo bomcan-ucba-muno 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,b,a m,u,n,o b,o,m,c,a,n a:15,c:16,b:16,m:16,o:16,n:16,u:3456 | grep GFLOPS >> tmp.dat
   echo nacomb-muno-ucba 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n,o u,c,b,a n,a,c,o,m,b a:16,c:16,b:16,m:16,o:15,n:16,u:3456 | grep GFLOPS >> tmp.dat
   echo cnaomb-ucba-nmuo 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,b,a n,m,u,o c,n,a,o,m,b a:15,c:16,b:16,m:16,o:16,n:16,u:3456 | grep GFLOPS >> tmp.dat
   echo bcnaom-ucba-nmuo 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,b,a n,m,u,o b,c,n,a,o,m a:15,c:16,b:16,m:16,o:16,n:16,u:3456 | grep GFLOPS >> tmp.dat
   echo mban-vnmu-bvua 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u b,v,u,a m,b,a,n a:64,b:64,m:64,n:60,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo bmna-bvua-vnmu 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,u,a v,n,m,u b,m,n,a a:60,b:64,m:64,n:64,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo abmn-bvua-unmv 4608 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,v,u,a u,n,m,v a,b,m,n a:72,b:64,m:64,n:64,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo mban-unmv-bvua 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,v b,v,u,a m,b,a,n a:64,b:64,m:64,n:60,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo am-vuwa-umvw 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,w,a u,m,v,w a,m a:72,m:64,u:64,w:64,v:64 | grep GFLOPS >> tmp.dat
   echo ma-umvw-vuwa 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v,w v,u,w,a m,a a:64,m:72,u:64,w:64,v:64 | grep GFLOPS >> tmp.dat
   echo ma-vwmu-vuwa 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,w,m,u v,u,w,a m,a a:64,u:64,m:72,w:64,v:64 | grep GFLOPS >> tmp.dat
   echo am-vuwa-vwmu 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,w,a v,w,m,u a,m a:72,m:64,u:64,w:64,v:64 | grep GFLOPS >> tmp.dat
   echo boanm-uavb-uonvm 648 17496 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v,b u,o,n,v,m b,o,a,n,m a:27,b:24,m:24,o:27,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo nbmoa-uonvm-uavb 17496 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,n,v,m u,a,v,b n,b,m,o,a a:24,b:27,m:27,o:27,n:24,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo anobm-uavb-mvuon 648 17496 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,v,b m,v,u,o,n a,n,o,b,m a:24,b:27,m:24,o:27,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo obnma-mvuon-uavb 15552 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,u,o,n u,a,v,b o,b,n,m,a a:24,b:27,m:24,o:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo nma-umwnv-uvaw 648 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,w,n,v u,v,a,w n,m,a a:768,m:27,n:24,u:24,w:27,v:27 | grep GFLOPS >> tmp.dat
   echo nam-umwnv-uvaw 648 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,w,n,v u,v,a,w n,a,m a:768,m:27,n:24,u:24,w:27,v:27 | grep GFLOPS >> tmp.dat
   echo mna-nmvwu-uvaw 576 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,v,w,u u,v,a,w m,n,a a:768,m:24,n:24,u:24,w:27,v:27 | grep GFLOPS >> tmp.dat
   echo nam-nmvwu-uvaw 648 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,v,w,u u,v,a,w n,a,m a:768,m:27,n:24,u:24,w:27,v:27 | grep GFLOPS >> tmp.dat
   echo bopnam-vuab-uvpmon 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b u,v,p,m,o,n b,o,p,n,a,m a:15,b:16,m:16,o:16,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo aomnbp-vuab-uvpmon 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,a,b u,v,p,m,o,n a,o,m,n,b,p a:16,b:15,m:16,o:16,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mobpan-ovpunm-vuab 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,p,u,n,m v,u,a,b m,o,b,p,a,n a:16,b:15,m:16,o:16,n:15,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo npomba-ovpunm-vuab 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,v,p,u,n,m v,u,a,b n,p,o,m,b,a a:16,b:15,m:15,o:16,n:16,p:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo maon-wnmvou-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,n,m,v,o,u a,w,u,v m,a,o,n a:3456,m:16,o:15,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo moan-wnmvou-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,n,m,v,o,u a,w,u,v m,o,a,n a:3456,m:16,o:15,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo naom-mnvuwo-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u,w,o a,w,u,v n,a,o,m a:3456,m:16,o:15,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo nmoa-mnvuwo-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,v,u,w,o a,w,u,v n,m,o,a a:3456,m:16,o:15,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mbcad-mu-bduac 24 472392 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u b,d,u,a,c m,b,c,a,d a:27,c:27,b:24,d:27,m:24,u:27 | grep GFLOPS >> tmp.dat
   echo cbadm-bduac-mu 419904 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,d,u,a,c m,u c,b,a,d,m a:27,c:24,b:24,d:27,m:24,u:27 | grep GFLOPS >> tmp.dat
   echo mcadb-um-bduac 24 472392 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m b,d,u,a,c m,c,a,d,b a:27,c:27,b:24,d:27,m:24,u:24 | grep GFLOPS >> tmp.dat
   echo bmcad-bduac-um 472392 24 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,d,u,a,c u,m b,m,c,a,d a:27,c:27,b:24,d:27,m:24,u:24 | grep GFLOPS >> tmp.dat
   echo cbmdan-caubd-num 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b,d n,u,m c,b,m,d,a,n a:15,c:16,b:16,d:16,m:16,n:16,u:200 | grep GFLOPS >> tmp.dat
   echo abncdm-caubd-num 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b,d n,u,m a,b,n,c,d,m a:16,c:16,b:15,d:16,m:16,n:16,u:200 | grep GFLOPS >> tmp.dat
   echo mcdnba-nmu-caubd 384 65536 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u c,a,u,b,d m,c,d,n,b,a a:16,c:16,b:16,d:16,m:24,n:16,u:200 | grep GFLOPS >> tmp.dat
   echo dcnbam-caubd-nmu 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,u,b,d n,m,u d,c,n,b,a,m a:15,c:16,b:16,d:16,m:16,n:16,u:200 | grep GFLOPS >> tmp.dat
   echo mbca-muv-cvuab 768 17496 729 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v c,v,u,a,b m,b,c,a a:27,c:24,b:27,m:768,u:27,v:27 | grep GFLOPS >> tmp.dat
   echo cbma-cvuab-muv 17496 768 729 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,v,u,a,b m,u,v c,b,m,a a:27,c:24,b:27,m:768,u:27,v:27 | grep GFLOPS >> tmp.dat
   echo ambc-cvuab-vmu 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,v,u,a,b v,m,u a,m,b,c a:24,c:24,b:27,m:768,u:27,v:24 | grep GFLOPS >> tmp.dat
   echo acmb-cvuab-vmu 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,v,u,a,b v,m,u a,c,m,b a:24,c:24,b:27,m:768,u:27,v:24 | grep GFLOPS >> tmp.dat
   echo bnacm-bcvau-unmv 17496 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,a,u u,n,m,v b,n,a,c,m a:27,c:27,b:24,m:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo cnamb-bcvau-unmv 15552 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,a,u u,n,m,v c,n,a,m,b a:27,c:24,b:24,m:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo bnmca-bcvau-umvn 17496 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,a,u u,m,v,n b,n,m,c,a a:27,c:27,b:24,m:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo acmbn-bcvau-umvn 15552 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,v,a,u u,m,v,n a,c,m,b,n a:24,c:27,b:24,m:24,n:27,u:24,v:27 | grep GFLOPS >> tmp.dat
   echo mba-vmwu-wabvu 768 648 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,w,u w,a,b,v,u m,b,a a:24,b:27,m:768,u:27,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo bam-wabvu-vmwu 648 768 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,a,b,v,u v,m,w,u b,a,m a:27,b:24,m:768,u:27,w:24,v:24 | grep GFLOPS >> tmp.dat
   echo bam-wabvu-uvwm 648 768 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,a,b,v,u u,v,w,m b,a,m a:27,b:24,m:768,u:24,w:24,v:27 | grep GFLOPS >> tmp.dat
   echo mba-uvwm-wabvu 768 648 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,w,m w,a,b,v,u m,b,a a:24,b:27,m:768,u:24,w:24,v:27 | grep GFLOPS >> tmp.dat
   echo bonamc-bacvu-nmuvo 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,v,u n,m,u,v,o b,o,n,a,m,c a:15,c:16,b:16,m:16,o:16,n:16,u:60,v:60 | grep GFLOPS >> tmp.dat
   echo mcnboa-nmuvo-bacvu 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u,v,o b,a,c,v,u m,c,n,b,o,a a:16,c:16,b:16,m:16,o:15,n:16,u:60,v:60 | grep GFLOPS >> tmp.dat
   echo bcnaom-bacvu-ouvnm 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,a,c,v,u o,u,v,n,m b,c,n,a,o,m a:15,c:16,b:16,m:16,o:16,n:16,u:60,v:60 | grep GFLOPS >> tmp.dat
   echo ncmabo-ouvnm-bacvu 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,v,n,m b,a,c,v,u n,c,m,a,b,o a:16,c:16,b:16,m:15,o:16,n:16,u:60,v:60 | grep GFLOPS >> tmp.dat
   echo mbna-unmvw-abuwv 648 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,v,w a,b,u,w,v m,b,n,a a:24,b:27,m:24,n:27,u:24,w:27,v:27 | grep GFLOPS >> tmp.dat
   echo mban-unmvw-abuwv 648 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,v,w a,b,u,w,v m,b,a,n a:24,b:27,m:24,n:27,u:24,w:27,v:27 | grep GFLOPS >> tmp.dat
   echo anmb-abuwv-wumvn 648 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,w,v w,u,m,v,n a,n,m,b a:24,b:27,m:24,n:27,u:27,w:24,v:27 | grep GFLOPS >> tmp.dat
   echo bamn-abuwv-wumvn 576 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,w,v w,u,m,v,n b,a,m,n a:24,b:24,m:24,n:27,u:27,w:24,v:27 | grep GFLOPS >> tmp.dat
   echo omnab-umwvon-vbawu 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,w,v,o,n v,b,a,w,u o,m,n,a,b a:60,b:60,m:15,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo oamnb-umwvon-vbawu 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,w,v,o,n v,b,a,w,u o,a,m,n,b a:60,b:60,m:15,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo oamnb-womuvn-vbawu 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,o,m,u,v,n v,b,a,w,u o,a,m,n,b a:60,b:60,m:15,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo ambno-vbawu-womuvn 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,w,u w,o,m,u,v,n a,m,b,n,o a:64,b:60,m:16,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo edacbm-adebcu-um 983040 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,e,b,c,u u,m e,d,a,c,b,m a:16,c:15,b:16,e:16,d:16,m:12,u:16 | grep GFLOPS >> tmp.dat
   echo cmdbae-adebcu-um 983040 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,e,b,c,u u,m c,m,d,b,a,e a:16,c:16,b:15,e:16,d:16,m:12,u:16 | grep GFLOPS >> tmp.dat
   echo acbemd-adebcu-mu 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,e,b,c,u m,u a,c,b,e,m,d a:16,c:15,b:16,e:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo becdma-adebcu-mu 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,e,b,c,u m,u b,e,c,d,m,a a:16,c:15,b:16,e:16,d:16,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo cdabm-cadvbu-vmu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,d,v,b,u v,m,u c,d,a,b,m a:15,c:16,b:16,d:16,m:200,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo macbd-vmu-cadvbu 192 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u c,a,d,v,b,u m,a,c,b,d a:16,c:16,b:16,d:16,m:192,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo abcdm-cadvbu-uvm 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,d,v,b,u u,v,m a,b,c,d,m a:16,c:16,b:15,d:16,m:200,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo damcb-cadvbu-uvm 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,a,d,v,b,u u,v,m d,a,m,c,b a:15,c:16,b:16,d:16,m:200,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo dcambn-vbaduc-muvn 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,d,u,c m,u,v,n d,c,a,m,b,n a:15,c:16,b:16,d:16,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mcandb-muvn-vbaduc 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v,n v,b,a,d,u,c m,c,a,n,d,b a:16,c:16,b:16,d:16,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo dnabmc-vbaduc-unmv 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,d,u,c u,n,m,v d,n,a,b,m,c a:15,c:16,b:16,d:16,m:16,n:15,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo ncabdm-unmv-vbaduc 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,n,m,v v,b,a,d,u,c n,c,a,b,d,m a:16,c:16,b:16,d:16,m:15,n:16,u:16,v:16 | grep GFLOPS >> tmp.dat
   echo mcab-umwv-avuwbc 3456 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,w,v a,v,u,w,b,c m,c,a,b a:16,c:16,b:16,m:3456,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mbac-umwv-avuwbc 3456 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,w,v a,v,u,w,b,c m,b,a,c a:16,c:16,b:16,m:3456,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mcba-wumv-avuwbc 3456 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,m,v a,v,u,w,b,c m,c,b,a a:16,c:16,b:16,m:3456,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo camb-avuwbc-wumv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u,w,b,c w,u,m,v c,a,m,b a:16,c:16,b:15,m:3456,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo mnbac-umvnw-abucvw 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v,n,w a,b,u,c,v,w m,n,b,a,c a:16,c:16,b:16,m:64,n:60,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo anmbc-abucvw-umvnw 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,c,v,w u,m,v,n,w a,n,m,b,c a:16,c:15,b:16,m:60,n:60,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo bmnca-abucvw-vmwun 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,c,v,w v,m,w,u,n b,m,n,c,a a:16,c:15,b:16,m:60,n:60,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo nacbm-vmwun-abucvw 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,w,u,n a,b,u,c,v,w n,a,c,b,m a:16,c:16,b:16,m:60,n:64,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo cmoabn-ubavcw-vuomwn 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v,c,w v,u,o,m,w,n c,m,o,a,b,n a:15,c:16,b:16,m:16,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo anmboc-ubavcw-vuomwn 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v,c,w v,u,o,m,w,n a,n,m,b,o,c a:16,c:15,b:16,m:16,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo nboamc-vunmwo-ubavcw 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,n,m,w,o u,b,a,v,c,w n,b,o,a,m,c a:16,c:16,b:16,m:15,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo bnaomc-ubavcw-vunmwo 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a,v,c,w v,u,n,m,w,o b,n,a,o,m,c a:15,c:16,b:16,m:16,o:16,n:16,u:16,w:16,v:16 | grep GFLOPS >> tmp.dat
   echo nam-mun-au 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n a,u n,a,m a:288,u:300,m:288,n:288 | grep GFLOPS >> tmp.dat
   echo nma-mun-au 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n a,u n,m,a a:288,u:300,m:288,n:288 | grep GFLOPS >> tmp.dat
   echo man-nmu-au 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u m,a,n a:288,u:300,m:288,n:288 | grep GFLOPS >> tmp.dat
   echo nam-nmu-au 86400 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,m,u a,u n,a,m a:288,u:300,m:300,n:288 | grep GFLOPS >> tmp.dat
   echo mona-mnou-ua 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,o,u u,a m,o,n,a a:72,u:72,m:72,o:72,n:72 | grep GFLOPS >> tmp.dat
   echo onam-mnou-ua 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,o,u u,a o,n,a,m a:72,u:72,m:72,o:72,n:72 | grep GFLOPS >> tmp.dat
   echo noam-onum-ua 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,u,m u,a n,o,a,m a:72,m:72,u:72,o:72,n:72 | grep GFLOPS >> tmp.dat
   echo amno-ua-onum 72 373248 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a o,n,u,m a,m,n,o a:72,m:72,u:72,o:72,n:72 | grep GFLOPS >> tmp.dat
   echo oanmp-noupm-au 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,u,p,m a,u o,a,n,m,p a:32,m:30,o:32,n:32,p:30,u:30 | grep GFLOPS >> tmp.dat
   echo npamo-noupm-au 864000 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,o,u,p,m a,u n,p,a,m,o a:32,m:30,o:30,n:32,p:30,u:30 | grep GFLOPS >> tmp.dat
   echo panmo-mpuon-au 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,p,u,o,n a,u p,a,n,m,o a:32,m:32,o:30,n:30,p:32,u:30 | grep GFLOPS >> tmp.dat
   echo poman-mpuon-au 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,p,u,o,n a,u p,o,m,a,n a:32,m:32,o:30,n:30,p:32,u:30 | grep GFLOPS >> tmp.dat
   echo omnqap-pnmuoq-au 1492992 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,n,m,u,o,q a,u o,m,n,q,a,p a:16,m:18,o:16,n:18,q:18,p:16,u:18 | grep GFLOPS >> tmp.dat
   echo npmqoa-pnmuoq-au 1492992 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py p,n,m,u,o,q a,u n,p,m,q,o,a a:16,m:18,o:18,n:16,q:18,p:16,u:18 | grep GFLOPS >> tmp.dat
   echo nmqpao-muopnq-au 1492992 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,p,n,q a,u n,m,q,p,a,o a:16,m:16,o:18,n:16,q:18,p:18,u:18 | grep GFLOPS >> tmp.dat
   echo mnpaoq-muopnq-au 1679616 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,p,n,q a,u m,n,p,a,o,q a:16,m:16,o:18,n:18,q:18,p:18,u:18 | grep GFLOPS >> tmp.dat
   echo bam-bua-um 86400 300 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a u,m b,a,m a:300,m:300,b:288,u:288 | grep GFLOPS >> tmp.dat
   echo abm-bua-um 82944 300 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a u,m a,b,m a:288,m:300,b:288,u:288 | grep GFLOPS >> tmp.dat
   echo amb-bua-mu 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a m,u a,m,b a:288,m:288,b:288,u:300 | grep GFLOPS >> tmp.dat
   echo bam-bua-mu 86400 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a m,u b,a,m a:300,m:288,b:288,u:300 | grep GFLOPS >> tmp.dat
   echo namb-mun-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n b,a,u n,a,m,b a:72,u:5000,b:72,m:72,n:72 | grep GFLOPS >> tmp.dat
   echo nabm-mun-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n b,a,u n,a,b,m a:72,u:5000,b:72,m:72,n:72 | grep GFLOPS >> tmp.dat
   echo nmab-umn-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n b,a,u n,m,a,b a:72,u:5000,b:72,m:72,n:72 | grep GFLOPS >> tmp.dat
   echo manb-umn-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,n b,a,u m,a,n,b a:72,u:5000,b:72,m:72,n:72 | grep GFLOPS >> tmp.dat
   echo am-avu-muv 288 288 90000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u m,u,v a,m a:288,m:288,u:300,v:300 | grep GFLOPS >> tmp.dat
   echo ma-muv-avu 288 288 90000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,v a,v,u m,a a:288,u:300,m:288,v:300 | grep GFLOPS >> tmp.dat
   echo ma-vmu-avu 288 288 86400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u a,v,u m,a a:288,u:300,m:288,v:288 | grep GFLOPS >> tmp.dat
   echo am-avu-vmu 288 300 86400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,u v,m,u a,m a:288,m:300,u:300,v:288 | grep GFLOPS >> tmp.dat
   echo ambon-uab-uomn 960 27000 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b u,o,m,n a,m,b,o,n a:32,b:30,m:30,o:30,n:30,u:864 | grep GFLOPS >> tmp.dat
   echo obman-uomn-uab 28800 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,m,n u,a,b o,b,m,a,n a:30,b:30,m:30,o:32,n:30,u:864 | grep GFLOPS >> tmp.dat
   echo nbmao-onum-uab 30720 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,n,u,m u,a,b n,b,m,a,o a:30,b:30,m:30,o:32,n:32,u:864 | grep GFLOPS >> tmp.dat
   echo aobmn-uab-onum 960 28800 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,a,b o,n,u,m a,o,b,m,n a:32,b:30,m:30,o:32,n:30,u:864 | grep GFLOPS >> tmp.dat
   echo mna-vnmu-uva 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u u,v,a m,n,a a:5000,u:72,n:72,m:72,v:72 | grep GFLOPS >> tmp.dat
   echo man-vnmu-uva 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,m,u u,v,a m,a,n a:5000,u:72,n:72,m:72,v:72 | grep GFLOPS >> tmp.dat
   echo anm-uva-nvum 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,a n,v,u,m a,n,m a:5184,m:72,v:72,u:72,n:72 | grep GFLOPS >> tmp.dat
   echo nma-nvum-uva 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,m u,v,a n,m,a a:5000,m:72,v:72,u:72,n:72 | grep GFLOPS >> tmp.dat
   echo anompb-uba-uonpm 288 104976 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a u,o,n,p,m a,n,o,m,p,b a:16,b:18,m:18,o:18,n:18,p:18,u:256 | grep GFLOPS >> tmp.dat
   echo omnbpa-uonpm-uba 93312 324 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,n,p,m u,b,a o,m,n,b,p,a a:18,b:18,m:18,o:16,n:18,p:18,u:256 | grep GFLOPS >> tmp.dat
   echo abmpno-uba-numop 288 93312 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,b,a n,u,m,o,p a,b,m,p,n,o a:16,b:18,m:18,o:18,n:16,p:18,u:256 | grep GFLOPS >> tmp.dat
   echo oapbmn-numop-uba 82944 324 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m,o,p u,b,a o,a,p,b,m,n a:18,b:18,m:18,o:16,n:16,p:18,u:256 | grep GFLOPS >> tmp.dat
   echo noam-nvuom-uav 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,o,m u,a,v n,o,a,m a:864,m:30,o:30,n:32,u:32,v:30 | grep GFLOPS >> tmp.dat
   echo onma-nvuom-uav 30720 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,o,m u,a,v o,n,m,a a:864,m:30,o:32,n:32,u:32,v:30 | grep GFLOPS >> tmp.dat
   echo noma-umovn-uav 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,o,v,n u,a,v n,o,m,a a:864,m:30,o:30,n:32,u:32,v:30 | grep GFLOPS >> tmp.dat
   echo noam-umovn-uav 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,o,v,n u,a,v n,o,a,m a:864,m:30,o:30,n:32,u:32,v:30 | grep GFLOPS >> tmp.dat
   echo amopn-vau-mvupon 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u m,v,u,p,o,n a,m,o,p,n a:240,m:16,o:18,n:18,p:18,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo apnom-vau-mvupon 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u m,v,u,p,o,n a,p,n,o,m a:240,m:16,o:18,n:18,p:18,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo anmop-vau-pnomvu 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u p,n,o,m,v,u a,n,m,o,p a:240,m:18,o:18,n:18,p:16,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo anmpo-vau-pnomvu 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,u p,n,o,m,v,u a,n,m,p,o a:240,m:18,o:18,n:18,p:16,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo cmab-aucb-um 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,c,b u,m c,m,a,b a:72,m:72,c:72,b:72,u:72 | grep GFLOPS >> tmp.dat
   echo bcam-aucb-um 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,c,b u,m b,c,a,m a:72,m:72,c:72,b:72,u:72 | grep GFLOPS >> tmp.dat
   echo mbca-mu-aucb 72 373248 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u a,u,c,b m,b,c,a a:72,m:72,c:72,b:72,u:72 | grep GFLOPS >> tmp.dat
   echo cmab-aucb-mu 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,c,b m,u c,m,a,b a:72,m:72,c:72,b:72,u:72 | grep GFLOPS >> tmp.dat
   echo namcb-num-acub 960 28800 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m a,c,u,b n,a,m,c,b a:32,c:30,b:30,m:30,n:32,u:864 | grep GFLOPS >> tmp.dat
   echo bnamc-acub-num 30720 960 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,u,b n,u,m b,n,a,m,c a:32,c:30,b:32,m:30,n:32,u:864 | grep GFLOPS >> tmp.dat
   echo cnabm-acub-umn 30720 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,u,b u,m,n c,n,a,b,m a:32,c:32,b:30,m:30,n:30,u:864 | grep GFLOPS >> tmp.dat
   echo anmbc-acub-umn 28800 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,c,u,b u,m,n a,n,m,b,c a:32,c:30,b:30,m:30,n:30,u:864 | grep GFLOPS >> tmp.dat
   echo mab-vmu-aubv 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u a,u,b,v m,a,b a:72,m:5184,b:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo bma-aubv-vmu 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v v,m,u b,m,a a:72,m:5000,b:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo amb-aubv-uvm 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,b,v u,v,m a,m,b a:72,m:5000,b:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo mba-uvm-aubv 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m a,u,b,v m,b,a a:72,m:5184,b:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo mbnaoc-muon-bcau 5184 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,n b,c,a,u m,b,n,a,o,c a:18,c:18,b:16,m:16,o:18,n:18,u:4500 | grep GFLOPS >> tmp.dat
   echo bmoacn-bcau-muon 5184 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,a,u m,u,o,n b,m,o,a,c,n a:18,c:18,b:16,m:16,o:18,n:18,u:4500 | grep GFLOPS >> tmp.dat
   echo nmcoba-oumn-bcau 4608 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,m,n b,c,a,u n,m,c,o,b,a a:18,c:18,b:16,m:18,o:16,n:16,u:4500 | grep GFLOPS >> tmp.dat
   echo cmbnao-bcau-oumn 4608 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,c,a,u o,u,m,n c,m,b,n,a,o a:18,c:16,b:16,m:18,o:16,n:18,u:4500 | grep GFLOPS >> tmp.dat
   echo mnab-vmun-auvb 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u,n a,u,v,b m,n,a,b a:72,b:72,m:72,n:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo mnba-vmun-auvb 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u,n a,u,v,b m,n,b,a a:72,b:72,m:72,n:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo banm-auvb-mnvu 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b m,n,v,u b,a,n,m a:72,b:72,m:72,n:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo anmb-auvb-mnvu 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b m,n,v,u a,n,m,b a:72,b:72,m:72,n:72,u:72,v:72 | grep GFLOPS >> tmp.dat
   echo am-avwu-vuwm 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,w,u v,u,w,m a,m a:72,m:72,u:72,w:72,v:72 | grep GFLOPS >> tmp.dat
   echo ma-vuwm-avwu 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,w,m a,v,w,u m,a a:72,m:72,u:72,w:72,v:72 | grep GFLOPS >> tmp.dat
   echo am-avwu-wmvu 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,v,w,u w,m,v,u a,m a:72,m:72,u:72,w:72,v:72 | grep GFLOPS >> tmp.dat
   echo ma-wmvu-avwu 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,v,u a,v,w,u m,a a:72,u:72,m:72,w:72,v:72 | grep GFLOPS >> tmp.dat
   echo oanmb-vnuom-abuv 28800 960 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,u,o,m a,b,u,v o,a,n,m,b a:32,b:30,m:30,o:32,n:30,u:30,v:32 | grep GFLOPS >> tmp.dat
   echo aonbm-abuv-vnuom 960 27000 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,b,u,v v,n,u,o,m a,o,n,b,m a:32,b:30,m:30,o:30,n:30,u:30,v:32 | grep GFLOPS >> tmp.dat
   echo obanm-omvun-abuv 28800 960 900 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,v,u,n a,b,u,v o,b,a,n,m a:32,b:30,m:30,o:32,n:30,u:30,v:30 | grep GFLOPS >> tmp.dat
   echo nbamo-omvun-abuv 30720 960 900 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,v,u,n a,b,u,v n,b,a,m,o a:32,b:30,m:30,o:32,n:32,u:30,v:30 | grep GFLOPS >> tmp.dat
   echo man-mvnuw-awvu 960 864 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,n,u,w a,w,v,u m,a,n a:864,m:32,n:30,u:30,w:30,v:30 | grep GFLOPS >> tmp.dat
   echo mna-mvnuw-awvu 960 864 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,v,n,u,w a,w,v,u m,n,a a:864,m:32,n:30,u:30,w:30,v:30 | grep GFLOPS >> tmp.dat
   echo amn-awvu-vnwmu 864 900 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,w,v,u v,n,w,m,u a,m,n a:864,m:30,n:30,u:30,w:30,v:32 | grep GFLOPS >> tmp.dat
   echo nam-vnwmu-awvu 960 864 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,n,w,m,u a,w,v,u n,a,m a:864,m:30,n:32,u:30,w:30,v:32 | grep GFLOPS >> tmp.dat
   echo bnpmao-vabu-omnupv 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,a,b,u o,m,n,u,p,v b,n,p,m,a,o a:15,b:16,m:18,o:16,n:18,p:18,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo pbanmo-omnupv-vabu 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,m,n,u,p,v v,a,b,u p,b,a,n,m,o a:16,b:16,m:18,o:16,n:18,p:16,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo mbpona-oumnpv-vabu 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,m,n,p,v v,a,b,u m,b,p,o,n,a a:16,b:16,m:16,o:16,n:18,p:18,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo pbnaom-oumnpv-vabu 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py o,u,m,n,p,v v,a,b,u p,b,n,a,o,m a:16,b:16,m:18,o:16,n:18,p:16,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo nmoa-mwovnu-vauw 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,w,o,v,n,u v,a,u,w n,m,o,a a:4500,m:16,o:18,n:16,u:18,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo omna-mwovnu-vauw 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,w,o,v,n,u v,a,u,w o,m,n,a a:4500,m:16,o:16,n:18,u:18,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo maon-munvow-vauw 5184 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n,v,o,w v,a,u,w m,a,o,n a:4500,m:16,o:18,n:18,u:18,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo omna-munvow-vauw 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,n,v,o,w v,a,u,w o,m,n,a a:4500,m:16,o:16,n:18,u:18,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo mcbda-um-adbcu 24 864000 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m a,d,b,c,u m,c,b,d,a a:32,c:30,b:30,d:30,m:24,u:32 | grep GFLOPS >> tmp.dat
   echo mbacd-um-adbcu 24 864000 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m a,d,b,c,u m,b,a,c,d a:32,c:30,b:30,d:30,m:24,u:32 | grep GFLOPS >> tmp.dat
   echo dabmc-adbcu-mu 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,b,c,u m,u d,a,b,m,c a:32,c:30,b:30,d:32,m:32,u:30 | grep GFLOPS >> tmp.dat
   echo cmabd-adbcu-mu 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,d,b,c,u m,u c,m,a,b,d a:32,c:32,b:30,d:30,m:32,u:30 | grep GFLOPS >> tmp.dat
   echo mbacnd-num-cubda 384 93312 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m c,u,b,d,a m,b,a,c,n,d a:18,c:16,b:18,d:18,m:24,n:16,u:250 | grep GFLOPS >> tmp.dat
   echo nbamdc-num-cubda 288 93312 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,u,m c,u,b,d,a n,b,a,m,d,c a:18,c:16,b:18,d:18,m:18,n:16,u:250 | grep GFLOPS >> tmp.dat
   echo dbmanc-cubda-mnu 82944 288 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,u,b,d,a m,n,u d,b,m,a,n,c a:18,c:16,b:18,d:16,m:16,n:18,u:250 | grep GFLOPS >> tmp.dat
   echo mdnabc-mnu-cubda 288 93312 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,n,u c,u,b,d,a m,d,n,a,b,c a:18,c:16,b:18,d:18,m:16,n:18,u:250 | grep GFLOPS >> tmp.dat
   echo amcb-vucab-muv 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,c,a,b m,u,v a,m,c,b a:32,c:30,b:30,m:864,u:30,v:32 | grep GFLOPS >> tmp.dat
   echo cbma-vucab-muv 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,c,a,b m,u,v c,b,m,a a:30,c:32,b:30,m:864,u:30,v:32 | grep GFLOPS >> tmp.dat
   echo mbac-umv-vucab 864 27000 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v v,u,c,a,b m,b,a,c a:30,c:30,b:30,m:864,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo acmb-vucab-umv 28800 864 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,c,a,b u,m,v a,c,m,b a:32,c:30,b:30,m:864,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo bnacm-vcabu-unmv 28800 900 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,c,a,b,u u,n,m,v b,n,a,c,m a:30,c:30,b:32,m:30,n:30,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo cnamb-vcabu-unmv 28800 900 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,c,a,b,u u,n,m,v c,n,a,m,b a:30,c:32,b:30,m:30,n:30,u:32,v:32 | grep GFLOPS >> tmp.dat
   echo nmcba-nvum-vcabu 960 27000 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py n,v,u,m v,c,a,b,u n,m,c,b,a a:30,c:30,b:30,m:30,n:32,u:30,v:32 | grep GFLOPS >> tmp.dat
   echo bmnac-vcabu-nvum 28800 960 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,c,a,b,u n,v,u,m b,m,n,a,c a:30,c:30,b:32,m:30,n:32,u:30,v:32 | grep GFLOPS >> tmp.dat
   echo mba-wumv-buavw 864 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,m,v b,u,a,v,w m,b,a a:30,b:32,m:864,u:30,w:32,v:30 | grep GFLOPS >> tmp.dat
   echo abm-buavw-wumv 768 864 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a,v,w w,u,m,v a,b,m a:24,b:32,m:864,u:30,w:32,v:30 | grep GFLOPS >> tmp.dat
   echo bam-buavw-mwuv 960 864 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,a,v,w m,w,u,v b,a,m a:30,b:32,m:864,u:30,w:30,v:30 | grep GFLOPS >> tmp.dat
   echo mab-mwuv-buavw 864 960 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,w,u,v b,u,a,v,w m,a,b a:30,b:32,m:864,u:30,w:30,v:30 | grep GFLOPS >> tmp.dat
   echo maoncb-muovn-cvbua 5184 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,v,n c,v,b,u,a m,a,o,n,c,b a:18,c:16,b:18,m:16,o:18,n:18,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo onambc-muovn-cvbua 4608 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py m,u,o,v,n c,v,b,u,a o,n,a,m,b,c a:18,c:16,b:18,m:16,o:16,n:18,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo cbanom-cvbua-monvu 5184 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,v,b,u,a m,o,n,v,u c,b,a,n,o,m a:18,c:16,b:18,m:16,o:18,n:18,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo abocnm-cvbua-monvu 4608 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py c,v,b,u,a m,o,n,v,u a,b,o,c,n,m a:16,c:16,b:18,m:16,o:18,n:18,u:64,v:64 | grep GFLOPS >> tmp.dat
   echo manb-wmvnu-buvwa 960 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,v,n,u b,u,v,w,a m,a,n,b a:30,b:32,m:32,n:30,u:30,w:32,v:30 | grep GFLOPS >> tmp.dat
   echo nbma-wmvnu-buvwa 960 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,m,v,n,u b,u,v,w,a n,b,m,a a:30,b:32,m:30,n:32,u:30,w:32,v:30 | grep GFLOPS >> tmp.dat
   echo mnba-wumvn-buvwa 960 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py w,u,m,v,n b,u,v,w,a m,n,b,a a:30,b:32,m:32,n:30,u:30,w:32,v:30 | grep GFLOPS >> tmp.dat
   echo abnm-buvwa-wumvn 768 900 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py b,u,v,w,a w,u,m,v,n a,b,n,m a:24,b:32,m:30,n:30,u:30,w:32,v:30 | grep GFLOPS >> tmp.dat
   echo boman-vbawu-umvown 3840 5832 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,b,a,w,u u,m,v,o,w,n b,o,m,a,n a:60,b:64,m:18,o:18,n:18,u:16,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo nobma-umvown-vbawu 5184 4096 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,m,v,o,w,n v,b,a,w,u n,o,b,m,a a:64,b:64,m:18,o:18,n:16,u:16,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo manbo-uownvm-vbawu 5184 4096 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,w,n,v,m v,b,a,w,u m,a,n,b,o a:64,b:64,m:16,o:18,n:18,u:16,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo oabnm-uownvm-vbawu 5184 4096 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,o,w,n,v,m v,b,a,w,u o,a,b,n,m a:64,b:64,m:18,o:16,n:18,u:16,w:18,v:16 | grep GFLOPS >> tmp.dat
   echo emabdc-ucdbea-um 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,d,b,e,a u,m e,m,a,b,d,c a:18,c:18,b:18,e:16,d:18,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo bcamed-ucdbea-um 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,d,b,e,a u,m b,c,a,m,e,d a:18,c:18,b:16,e:18,d:18,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo emadcb-ucdbea-mu 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,d,b,e,a m,u e,m,a,d,c,b a:18,c:18,b:18,e:16,d:18,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo edcbam-ucdbea-mu 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,c,d,b,e,a m,u e,d,c,b,a,m a:18,c:18,b:18,e:16,d:18,m:16,u:16 | grep GFLOPS >> tmp.dat
   echo mdbca-vmu-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u b,d,u,a,v,c m,d,b,c,a a:18,c:18,b:16,d:18,m:240,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo mdabc-vmu-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,m,u b,d,u,a,v,c m,d,a,b,c a:18,c:18,b:16,d:18,m:240,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo mabcd-uvm-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m b,d,u,a,v,c m,a,b,c,d a:18,c:18,b:16,d:18,m:240,u:16,v:18 | grep GFLOPS >> tmp.dat
   echo mcdba-uvm-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py u,v,m b,d,u,a,v,c m,c,d,b,a a:18,c:18,b:16,d:18,m:240,u:16,v:18 | grep GFLOPS >> tmp.dat
   echo ndcmba-vumn-auvbcd 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py v,u,m,n a,u,v,b,c,d n,d,c,m,b,a a:16,c:18,b:18,d:18,m:15,n:16,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo cmbnad-auvbcd-vumn 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b,c,d v,u,m,n c,m,b,n,a,d a:16,c:16,b:18,d:18,m:16,n:16,u:18,v:16 | grep GFLOPS >> tmp.dat
   echo dabmcn-auvbcd-nmvu 82944 256 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python benchmark.py a,u,v,b,c,d n,m,v,u d,a,b,m,c,n a:16,c:18,b:18,d:16,m:16,n:16,u:18,v:18 | grep GFLOPS >> tmp.dat
   cat tmp.dat | sed '$!N;s/\n/ /' > tmp2.dat
   python maxFromFiles.py tmp2.dat tcl.dat 4,6
done
