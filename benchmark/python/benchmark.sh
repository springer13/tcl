# $1: number of threads

for i in `seq 1 2`;
do
  rm -f tmp2.dat tmp.dat
   echo nma-umn-au 12960 120 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl0.py | grep GFLOPS >> tmp.dat
   echo anm-au-umn 120 11664 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1.py | grep GFLOPS >> tmp.dat
   echo man-mun-au 12960 120 108 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl2.py | grep GFLOPS >> tmp.dat
   echo mna-mun-au 12960 120 108 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl3.py | grep GFLOPS >> tmp.dat
   echo onam-uomn-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl4.py | grep GFLOPS >> tmp.dat
   echo nmao-uomn-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl5.py | grep GFLOPS >> tmp.dat
   echo mona-nomu-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl6.py | grep GFLOPS >> tmp.dat
   echo onam-nomu-au 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl7.py | grep GFLOPS >> tmp.dat
   echo nmpao-umnpo-ua 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl8.py | grep GFLOPS >> tmp.dat
   echo maopn-umnpo-ua 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl9.py | grep GFLOPS >> tmp.dat
   echo pnoma-opmun-ua 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl10.py | grep GFLOPS >> tmp.dat
   echo apnmo-ua-opmun 24 65536 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl11.py | grep GFLOPS >> tmp.dat
   echo qpoman-pqmnou-ua 57600 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl12.py | grep GFLOPS >> tmp.dat
   echo nmaqpo-pqmnou-ua 57600 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl13.py | grep GFLOPS >> tmp.dat
   echo napqmo-opmuqn-ua 57600 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl14.py | grep GFLOPS >> tmp.dat
   echo omqpan-opmuqn-ua 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl15.py | grep GFLOPS >> tmp.dat
   echo abm-uba-um 12960 108 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl16.py | grep GFLOPS >> tmp.dat
   echo mab-um-uba 120 11664 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl17.py | grep GFLOPS >> tmp.dat
   echo bma-uba-mu 12960 120 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl18.py | grep GFLOPS >> tmp.dat
   echo mab-mu-uba 120 11664 120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl19.py | grep GFLOPS >> tmp.dat
   echo nmba-mun-uab 768 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl20.py | grep GFLOPS >> tmp.dat
   echo anmb-uab-mun 960 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl21.py | grep GFLOPS >> tmp.dat
   echo banm-uab-num 960 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl22.py | grep GFLOPS >> tmp.dat
   echo manb-num-uab 768 1024 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl23.py | grep GFLOPS >> tmp.dat
   echo am-vua-vmu 120 108 12960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl24.py | grep GFLOPS >> tmp.dat
   echo ma-vmu-vua 120 108 12960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl25.py | grep GFLOPS >> tmp.dat
   echo ma-umv-vua 120 108 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl26.py | grep GFLOPS >> tmp.dat
   echo am-vua-umv 120 108 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl27.py | grep GFLOPS >> tmp.dat
   echo aobmn-bau-uonm 384 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl28.py | grep GFLOPS >> tmp.dat
   echo bomna-bau-uonm 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl29.py | grep GFLOPS >> tmp.dat
   echo abomn-bau-ounm 384 4096 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl30.py | grep GFLOPS >> tmp.dat
   echo mnabo-ounm-bau 3840 256 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl31.py | grep GFLOPS >> tmp.dat
   echo nam-uvnm-avu 960 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl32.py | grep GFLOPS >> tmp.dat
   echo amn-avu-uvnm 1152 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl33.py | grep GFLOPS >> tmp.dat
   echo nam-muvn-avu 768 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl34.py | grep GFLOPS >> tmp.dat
   echo amn-avu-muvn 1152 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl35.py | grep GFLOPS >> tmp.dat
   echo omnbpa-nopum-uab 5760 100 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl36.py | grep GFLOPS >> tmp.dat
   echo oapbmn-nopum-uab 5760 100 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl37.py | grep GFLOPS >> tmp.dat
   echo bnmapo-uab-numop 72 8000 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl38.py | grep GFLOPS >> tmp.dat
   echo apbnom-uab-numop 72 8000 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl39.py | grep GFLOPS >> tmp.dat
   echo amno-vau-oumvn 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl40.py | grep GFLOPS >> tmp.dat
   echo anom-vau-oumvn 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl41.py | grep GFLOPS >> tmp.dat
   echo amno-vau-ovunm 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl42.py | grep GFLOPS >> tmp.dat
   echo amon-vau-ovunm 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl43.py | grep GFLOPS >> tmp.dat
   echo amonp-vua-pvnuom 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl44.py | grep GFLOPS >> tmp.dat
   echo apmon-vua-pvnuom 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl45.py | grep GFLOPS >> tmp.dat
   echo ampno-vua-puvmon 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl46.py | grep GFLOPS >> tmp.dat
   echo amnop-vua-puvmon 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl47.py | grep GFLOPS >> tmp.dat
   echo cmab-bacu-um 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl48.py | grep GFLOPS >> tmp.dat
   echo bcam-bacu-um 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl49.py | grep GFLOPS >> tmp.dat
   echo camb-bacu-mu 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl50.py | grep GFLOPS >> tmp.dat
   echo amcb-bacu-mu 30720 32 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl51.py | grep GFLOPS >> tmp.dat
   echo nacmb-unm-cbua 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl52.py | grep GFLOPS >> tmp.dat
   echo mnbca-unm-cbua 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl53.py | grep GFLOPS >> tmp.dat
   echo canbm-cbua-num 3840 256 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl54.py | grep GFLOPS >> tmp.dat
   echo cmnba-cbua-num 3840 256 270 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl55.py | grep GFLOPS >> tmp.dat
   echo mba-muv-abvu 1152 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl56.py | grep GFLOPS >> tmp.dat
   echo bma-abvu-muv 768 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl57.py | grep GFLOPS >> tmp.dat
   echo amb-abvu-umv 960 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl58.py | grep GFLOPS >> tmp.dat
   echo bma-abvu-umv 768 1152 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl59.py | grep GFLOPS >> tmp.dat
   echo aombnc-ubac-nmou 720 800 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl60.py | grep GFLOPS >> tmp.dat
   echo mncboa-nmou-ubac 576 1000 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl61.py | grep GFLOPS >> tmp.dat
   echo oamnbc-unmo-ubac 720 1000 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl62.py | grep GFLOPS >> tmp.dat
   echo oambnc-unmo-ubac 720 1000 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl63.py | grep GFLOPS >> tmp.dat
   echo bnam-auvb-nvmu 768 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl64.py | grep GFLOPS >> tmp.dat
   echo nbma-nvmu-auvb 960 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl65.py | grep GFLOPS >> tmp.dat
   echo amnb-auvb-mvun 960 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl66.py | grep GFLOPS >> tmp.dat
   echo bman-auvb-mvun 768 1024 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl67.py | grep GFLOPS >> tmp.dat
   echo am-uavw-vmwu 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl68.py | grep GFLOPS >> tmp.dat
   echo ma-vmwu-uavw 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl69.py | grep GFLOPS >> tmp.dat
   echo ma-mvuw-uavw 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl70.py | grep GFLOPS >> tmp.dat
   echo am-uavw-mvuw 24 32 32768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl71.py | grep GFLOPS >> tmp.dat
   echo mabno-muvon-ubav 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl72.py | grep GFLOPS >> tmp.dat
   echo nmabo-muvon-ubav 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl73.py | grep GFLOPS >> tmp.dat
   echo mbnao-vnoum-ubav 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl74.py | grep GFLOPS >> tmp.dat
   echo bmaon-ubav-vnoum 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl75.py | grep GFLOPS >> tmp.dat
   echo anm-uwav-mnwvu 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl76.py | grep GFLOPS >> tmp.dat
   echo amn-uwav-vwunm 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl77.py | grep GFLOPS >> tmp.dat
   echo anm-uwav-mwvnu 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl78.py | grep GFLOPS >> tmp.dat
   echo amn-uwav-mwvnu 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl79.py | grep GFLOPS >> tmp.dat
   echo obpanm-nvupmo-aubv 5760 80 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl80.py | grep GFLOPS >> tmp.dat
   echo ampbon-aubv-nvupmo 72 8000 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl81.py | grep GFLOPS >> tmp.dat
   echo noapmb-npomuv-aubv 7200 80 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl82.py | grep GFLOPS >> tmp.dat
   echo aonmbp-aubv-npomuv 72 8000 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl83.py | grep GFLOPS >> tmp.dat
   echo nmao-nvuwom-vwua 720 972 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl84.py | grep GFLOPS >> tmp.dat
   echo namo-nvuwom-vwua 720 972 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl85.py | grep GFLOPS >> tmp.dat
   echo mano-uvmnwo-vwua 720 972 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl86.py | grep GFLOPS >> tmp.dat
   echo onam-uvmnwo-vwua 720 972 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl87.py | grep GFLOPS >> tmp.dat
   echo bdcma-udbca-mu 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl88.py | grep GFLOPS >> tmp.dat
   echo cdamb-udbca-mu 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl89.py | grep GFLOPS >> tmp.dat
   echo dmcba-udbca-um 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl90.py | grep GFLOPS >> tmp.dat
   echo dcbma-udbca-um 61440 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl91.py | grep GFLOPS >> tmp.dat
   echo nacbmd-mnu-abudc 192 8000 90 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl92.py | grep GFLOPS >> tmp.dat
   echo dbcanm-abudc-mnu 5760 80 90 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl93.py | grep GFLOPS >> tmp.dat
   echo mcdnba-umn-abudc 72 8000 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl94.py | grep GFLOPS >> tmp.dat
   echo cdnmba-abudc-umn 5760 100 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl95.py | grep GFLOPS >> tmp.dat
   echo macb-uvm-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl96.py | grep GFLOPS >> tmp.dat
   echo mbca-uvm-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl97.py | grep GFLOPS >> tmp.dat
   echo mcba-umv-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl98.py | grep GFLOPS >> tmp.dat
   echo mbca-umv-abvcu 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl99.py | grep GFLOPS >> tmp.dat
   echo mbnac-uvmn-avcub 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl100.py | grep GFLOPS >> tmp.dat
   echo cnmba-avcub-uvmn 3840 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl101.py | grep GFLOPS >> tmp.dat
   echo nambc-mnvu-avcub 384 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl102.py | grep GFLOPS >> tmp.dat
   echo macbn-mnvu-avcub 240 4096 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl103.py | grep GFLOPS >> tmp.dat
   echo mba-wuvm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl104.py | grep GFLOPS >> tmp.dat
   echo mab-wuvm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl105.py | grep GFLOPS >> tmp.dat
   echo mba-uvwm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl106.py | grep GFLOPS >> tmp.dat
   echo mab-uvwm-wvaub 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl107.py | grep GFLOPS >> tmp.dat
   echo cmobna-bcvau-unvom 576 1000 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl108.py | grep GFLOPS >> tmp.dat
   echo bmaocn-bcvau-unvom 720 1000 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl109.py | grep GFLOPS >> tmp.dat
   echo mocbna-uvomn-bcvau 720 800 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl110.py | grep GFLOPS >> tmp.dat
   echo ocanmb-uvomn-bcvau 720 800 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl111.py | grep GFLOPS >> tmp.dat
   echo manb-vnwum-vuabw 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl112.py | grep GFLOPS >> tmp.dat
   echo banm-vuabw-vnwum 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl113.py | grep GFLOPS >> tmp.dat
   echo ambn-vuabw-nwumv 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl114.py | grep GFLOPS >> tmp.dat
   echo anmb-vuabw-nwumv 240 256 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl115.py | grep GFLOPS >> tmp.dat
   echo bonma-auvwb-nuomwv 768 800 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl116.py | grep GFLOPS >> tmp.dat
   echo obmna-nuomwv-auvwb 576 1024 1000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl117.py | grep GFLOPS >> tmp.dat
   echo boanm-auvwb-wumovn 768 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl118.py | grep GFLOPS >> tmp.dat
   echo ambon-auvwb-wumovn 960 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl119.py | grep GFLOPS >> tmp.dat
   echo acmbed-ucebad-mu 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl120.py | grep GFLOPS >> tmp.dat
   echo mdeabc-mu-ucebad 24 100000 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl121.py | grep GFLOPS >> tmp.dat
   echo becdam-ucebad-um 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl122.py | grep GFLOPS >> tmp.dat
   echo abmcde-ucebad-um 72000 8 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl123.py | grep GFLOPS >> tmp.dat
   echo cambd-adbuvc-mvu 5760 96 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl124.py | grep GFLOPS >> tmp.dat
   echo dacmb-adbuvc-mvu 5760 96 100 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl125.py | grep GFLOPS >> tmp.dat
   echo mbdca-vum-adbuvc 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl126.py | grep GFLOPS >> tmp.dat
   echo mcabd-vum-adbuvc 96 8000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl127.py | grep GFLOPS >> tmp.dat
   echo mbdcna-unvm-udavcb 72 10000 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl128.py | grep GFLOPS >> tmp.dat
   echo bmacnd-udavcb-unvm 7200 100 80 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl129.py | grep GFLOPS >> tmp.dat
   echo adcmbn-udavcb-vmnu 7200 100 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl130.py | grep GFLOPS >> tmp.dat
   echo acnmdb-udavcb-vmnu 7200 100 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl131.py | grep GFLOPS >> tmp.dat
   echo bmac-wvbuca-mvuw 720 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl132.py | grep GFLOPS >> tmp.dat
   echo cbma-wvbuca-mvuw 720 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl133.py | grep GFLOPS >> tmp.dat
   echo bamc-wvbuca-wuvm 720 972 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl134.py | grep GFLOPS >> tmp.dat
   echo macb-wuvm-wvbuca 960 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl135.py | grep GFLOPS >> tmp.dat
   echo anmbc-uvawcb-vwnum 720 1024 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl136.py | grep GFLOPS >> tmp.dat
   echo ancmb-uvawcb-vwnum 720 1024 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl137.py | grep GFLOPS >> tmp.dat
   echo mbnca-vmwun-uvawcb 960 1000 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl138.py | grep GFLOPS >> tmp.dat
   echo bnmca-uvawcb-vmwun 720 1024 640 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl139.py | grep GFLOPS >> tmp.dat
   echo nmcoba-muwvno-vwubca 576 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl140.py | grep GFLOPS >> tmp.dat
   echo ombnac-muwvno-vwubca 576 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl141.py | grep GFLOPS >> tmp.dat
   echo anbomc-vwubca-onwmuv 720 800 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl142.py | grep GFLOPS >> tmp.dat
   echo nbamco-onwmuv-vwubca 576 1000 800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl143.py | grep GFLOPS >> tmp.dat
   echo anm-au-umn 144 17280 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl144.py | grep GFLOPS >> tmp.dat
   echo man-umn-au 19440 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl145.py | grep GFLOPS >> tmp.dat
   echo man-nmu-au 20736 144 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl146.py | grep GFLOPS >> tmp.dat
   echo mna-nmu-au 20736 144 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl147.py | grep GFLOPS >> tmp.dat
   echo oman-mnuo-au 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl148.py | grep GFLOPS >> tmp.dat
   echo anom-au-mnuo 48 64000 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl149.py | grep GFLOPS >> tmp.dat
   echo onma-umno-au 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl150.py | grep GFLOPS >> tmp.dat
   echo nmao-umno-au 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl151.py | grep GFLOPS >> tmp.dat
   echo pomna-upmon-ua 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl152.py | grep GFLOPS >> tmp.dat
   echo pnaom-upmon-ua 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl153.py | grep GFLOPS >> tmp.dat
   echo ompna-onupm-ua 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl154.py | grep GFLOPS >> tmp.dat
   echo namop-onupm-ua 92160 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl155.py | grep GFLOPS >> tmp.dat
   echo panqmo-qonump-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl156.py | grep GFLOPS >> tmp.dat
   echo pomqna-qonump-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl157.py | grep GFLOPS >> tmp.dat
   echo noaqpm-muopqn-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl158.py | grep GFLOPS >> tmp.dat
   echo qoapmn-muopqn-au 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl159.py | grep GFLOPS >> tmp.dat
   echo mab-mu-aub 144 19440 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl160.py | grep GFLOPS >> tmp.dat
   echo bam-aub-mu 20736 144 135 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl161.py | grep GFLOPS >> tmp.dat
   echo amb-aub-um 19440 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl162.py | grep GFLOPS >> tmp.dat
   echo bam-aub-um 20736 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl163.py | grep GFLOPS >> tmp.dat
   echo bnma-uba-mnu 1440 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl164.py | grep GFLOPS >> tmp.dat
   echo nmab-mnu-uba 1920 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl165.py | grep GFLOPS >> tmp.dat
   echo nbma-umn-uba 1440 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl166.py | grep GFLOPS >> tmp.dat
   echo anmb-uba-umn 1440 1600 1536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl167.py | grep GFLOPS >> tmp.dat
   echo ma-vum-vau 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl168.py | grep GFLOPS >> tmp.dat
   echo am-vau-vum 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl169.py | grep GFLOPS >> tmp.dat
   echo ma-vmu-vau 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl170.py | grep GFLOPS >> tmp.dat
   echo am-vau-vmu 144 128 19440 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl171.py | grep GFLOPS >> tmp.dat
   echo monba-noum-abu 4608 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl172.py | grep GFLOPS >> tmp.dat
   echo amnbo-abu-noum 288 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl173.py | grep GFLOPS >> tmp.dat
   echo bmnao-abu-ounm 384 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl174.py | grep GFLOPS >> tmp.dat
   echo omnba-ounm-abu 5760 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl175.py | grep GFLOPS >> tmp.dat
   echo anm-auv-umvn 1536 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl176.py | grep GFLOPS >> tmp.dat
   echo nma-umvn-auv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl177.py | grep GFLOPS >> tmp.dat
   echo anm-auv-vnum 1536 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl178.py | grep GFLOPS >> tmp.dat
   echo nam-vnum-auv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl179.py | grep GFLOPS >> tmp.dat
   echo onampb-omunp-bau 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl180.py | grep GFLOPS >> tmp.dat
   echo mnbpao-omunp-bau 9216 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl181.py | grep GFLOPS >> tmp.dat
   echo nbmpao-uponm-bau 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl182.py | grep GFLOPS >> tmp.dat
   echo omnbpa-uponm-bau 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl183.py | grep GFLOPS >> tmp.dat
   echo amno-avu-nvoum 288 6400 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl184.py | grep GFLOPS >> tmp.dat
   echo mano-nvoum-avu 4608 320 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl185.py | grep GFLOPS >> tmp.dat
   echo amon-avu-vnuom 288 8000 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl186.py | grep GFLOPS >> tmp.dat
   echo oanm-vnuom-avu 5760 320 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl187.py | grep GFLOPS >> tmp.dat
   echo pamno-opunvm-avu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl188.py | grep GFLOPS >> tmp.dat
   echo panmo-opunvm-avu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl189.py | grep GFLOPS >> tmp.dat
   echo amopn-avu-nmuvpo 120 13824 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl190.py | grep GFLOPS >> tmp.dat
   echo apmno-avu-nmuvpo 120 13824 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl191.py | grep GFLOPS >> tmp.dat
   echo macb-mu-abcu 48 64000 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl192.py | grep GFLOPS >> tmp.dat
   echo cbma-abcu-mu 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl193.py | grep GFLOPS >> tmp.dat
   echo cbma-abcu-um 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl194.py | grep GFLOPS >> tmp.dat
   echo camb-abcu-um 57600 40 40 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl195.py | grep GFLOPS >> tmp.dat
   echo nabmc-num-caub 288 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl196.py | grep GFLOPS >> tmp.dat
   echo cnmab-caub-num 5760 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl197.py | grep GFLOPS >> tmp.dat
   echo ambcn-caub-mnu 4608 320 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl198.py | grep GFLOPS >> tmp.dat
   echo nbacm-mnu-caub 384 6400 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl199.py | grep GFLOPS >> tmp.dat
   echo bma-uvba-umv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl200.py | grep GFLOPS >> tmp.dat
   echo abm-uvba-umv 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl201.py | grep GFLOPS >> tmp.dat
   echo mab-vum-uvba 1536 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl202.py | grep GFLOPS >> tmp.dat
   echo bma-uvba-vum 1440 1536 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl203.py | grep GFLOPS >> tmp.dat
   echo maocnb-mnou-abcu 1152 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl204.py | grep GFLOPS >> tmp.dat
   echo mcnboa-mnou-abcu 1152 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl205.py | grep GFLOPS >> tmp.dat
   echo cmboan-abcu-omun 768 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl206.py | grep GFLOPS >> tmp.dat
   echo onbacm-omun-abcu 1152 1152 1500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl207.py | grep GFLOPS >> tmp.dat
   echo bman-aubv-vmun 1920 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl208.py | grep GFLOPS >> tmp.dat
   echo nbma-vmun-aubv 1440 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl209.py | grep GFLOPS >> tmp.dat
   echo nbma-mvun-aubv 1920 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl210.py | grep GFLOPS >> tmp.dat
   echo mnba-mvun-aubv 1440 1600 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl211.py | grep GFLOPS >> tmp.dat
   echo ma-mvuw-awuv 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl212.py | grep GFLOPS >> tmp.dat
   echo am-awuv-mvuw 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl213.py | grep GFLOPS >> tmp.dat
   echo ma-vwmu-awuv 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl214.py | grep GFLOPS >> tmp.dat
   echo am-awuv-vwmu 48 40 64000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl215.py | grep GFLOPS >> tmp.dat
   echo noabm-uvnmo-aubv 5760 288 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl216.py | grep GFLOPS >> tmp.dat
   echo abomn-aubv-uvnmo 288 8000 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl217.py | grep GFLOPS >> tmp.dat
   echo oabmn-unvmo-aubv 5760 288 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl218.py | grep GFLOPS >> tmp.dat
   echo abnom-aubv-unvmo 288 8000 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl219.py | grep GFLOPS >> tmp.dat
   echo amn-uvwa-vnuwm 288 400 5120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl220.py | grep GFLOPS >> tmp.dat
   echo man-vnuwm-uvwa 288 324 5120 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl221.py | grep GFLOPS >> tmp.dat
   echo man-unvmw-uvwa 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl222.py | grep GFLOPS >> tmp.dat
   echo amn-uvwa-unvmw 288 400 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl223.py | grep GFLOPS >> tmp.dat
   echo maonbp-umnpvo-aubv 13824 96 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl224.py | grep GFLOPS >> tmp.dat
   echo aonbpm-aubv-umnpvo 96 20736 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl225.py | grep GFLOPS >> tmp.dat
   echo onapbm-mvpoun-aubv 9216 96 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl226.py | grep GFLOPS >> tmp.dat
   echo mopnab-mvpoun-aubv 13824 96 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl227.py | grep GFLOPS >> tmp.dat
   echo noma-nmvuow-auvw 1152 1536 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl228.py | grep GFLOPS >> tmp.dat
   echo anom-auvw-nmvuow 1536 1152 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl229.py | grep GFLOPS >> tmp.dat
   echo mano-vnwomu-auvw 1152 1536 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl230.py | grep GFLOPS >> tmp.dat
   echo amon-auvw-vnwomu 1536 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl231.py | grep GFLOPS >> tmp.dat
   echo dmbac-buadc-um 92160 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl232.py | grep GFLOPS >> tmp.dat
   echo bmacd-buadc-um 115200 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl233.py | grep GFLOPS >> tmp.dat
   echo dbcam-buadc-mu 92160 16 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl234.py | grep GFLOPS >> tmp.dat
   echo mcdba-mu-buadc 24 128000 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl235.py | grep GFLOPS >> tmp.dat
   echo bcndma-uacdb-nmu 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl236.py | grep GFLOPS >> tmp.dat
   echo dmcanb-uacdb-nmu 13824 96 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl237.py | grep GFLOPS >> tmp.dat
   echo badmnc-uacdb-unm 13824 144 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl238.py | grep GFLOPS >> tmp.dat
   echo nbcmad-unm-uacdb 96 20736 128 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl239.py | grep GFLOPS >> tmp.dat
   echo bmca-aubcv-uvm 4608 324 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl240.py | grep GFLOPS >> tmp.dat
   echo mbac-uvm-aubcv 288 6400 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl241.py | grep GFLOPS >> tmp.dat
   echo bamc-aubcv-vum 4608 324 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl242.py | grep GFLOPS >> tmp.dat
   echo cmba-aubcv-vum 4608 324 320 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl243.py | grep GFLOPS >> tmp.dat
   echo bmacn-cubav-mnuv 4608 288 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl244.py | grep GFLOPS >> tmp.dat
   echo bcanm-cubav-mnuv 4608 288 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl245.py | grep GFLOPS >> tmp.dat
   echo nbcam-mnvu-cubav 384 6400 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl246.py | grep GFLOPS >> tmp.dat
   echo mcanb-mnvu-cubav 288 6400 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl247.py | grep GFLOPS >> tmp.dat
   echo bma-ubavw-mwvu 288 320 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl248.py | grep GFLOPS >> tmp.dat
   echo mab-mwvu-ubavw 288 400 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl249.py | grep GFLOPS >> tmp.dat
   echo amb-ubavw-uvmw 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl250.py | grep GFLOPS >> tmp.dat
   echo bma-ubavw-uvmw 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl251.py | grep GFLOPS >> tmp.dat
   echo amcnbo-bvcau-unomv 768 1728 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl252.py | grep GFLOPS >> tmp.dat
   echo mobcna-unomv-bvcau 1152 1152 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl253.py | grep GFLOPS >> tmp.dat
   echo nobmac-uvnmo-bvcau 1152 1152 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl254.py | grep GFLOPS >> tmp.dat
   echo bmaocn-bvcau-uvnmo 1152 1728 1600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl255.py | grep GFLOPS >> tmp.dat
   echo abmn-auvwb-vunwm 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl256.py | grep GFLOPS >> tmp.dat
   echo banm-auvwb-vunwm 384 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl257.py | grep GFLOPS >> tmp.dat
   echo abnm-auvwb-wnvum 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl258.py | grep GFLOPS >> tmp.dat
   echo anbm-auvwb-wnvum 288 324 6400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl259.py | grep GFLOPS >> tmp.dat
   echo moanb-nwmuov-uvwab 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl260.py | grep GFLOPS >> tmp.dat
   echo moban-nwmuov-uvwab 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl261.py | grep GFLOPS >> tmp.dat
   echo mnbao-ounwvm-uvwab 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl262.py | grep GFLOPS >> tmp.dat
   echo boamn-uvwab-ounwvm 1440 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl263.py | grep GFLOPS >> tmp.dat
   echo mbadec-um-cbduea 24 165888 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl264.py | grep GFLOPS >> tmp.dat
   echo mdabec-um-cbduea 24 165888 8 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl265.py | grep GFLOPS >> tmp.dat
   echo bemcad-cbduea-mu 110592 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl266.py | grep GFLOPS >> tmp.dat
   echo mecdab-mu-cbduea 24 165888 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl267.py | grep GFLOPS >> tmp.dat
   echo adcbm-cauvdb-umv 9216 128 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl268.py | grep GFLOPS >> tmp.dat
   echo dcmab-cauvdb-umv 9216 128 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl269.py | grep GFLOPS >> tmp.dat
   echo dabcm-cauvdb-mvu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl270.py | grep GFLOPS >> tmp.dat
   echo dcbam-cauvdb-mvu 9216 128 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl271.py | grep GFLOPS >> tmp.dat
   echo cdabnm-vbadcu-uvmn 13824 144 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl272.py | grep GFLOPS >> tmp.dat
   echo mdnacb-uvmn-vbadcu 96 20736 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl273.py | grep GFLOPS >> tmp.dat
   echo mcabdn-mvnu-vbadcu 96 20736 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl274.py | grep GFLOPS >> tmp.dat
   echo ndacbm-mvnu-vbadcu 192 20736 96 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl275.py | grep GFLOPS >> tmp.dat
   echo abmc-auvbwc-mvuw 1152 1536 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl276.py | grep GFLOPS >> tmp.dat
   echo bcam-auvbwc-mvuw 768 1536 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl277.py | grep GFLOPS >> tmp.dat
   echo cbam-auvbwc-vwmu 768 1500 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl278.py | grep GFLOPS >> tmp.dat
   echo mcba-vwmu-auvbwc 1536 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl279.py | grep GFLOPS >> tmp.dat
   echo cmanb-auwvcb-vumwn 768 1600 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl280.py | grep GFLOPS >> tmp.dat
   echo mabcn-vumwn-auwvcb 1440 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl281.py | grep GFLOPS >> tmp.dat
   echo bmcna-auwvcb-nmwuv 768 1600 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl282.py | grep GFLOPS >> tmp.dat
   echo bmacn-auwvcb-nmwuv 768 1600 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl283.py | grep GFLOPS >> tmp.dat
   echo nobacm-vunwom-bvcwau 1152 1152 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl284.py | grep GFLOPS >> tmp.dat
   echo abmnoc-bvcwau-vunwom 768 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl285.py | grep GFLOPS >> tmp.dat
   echo cbanom-bvcwau-vnmwuo 768 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl286.py | grep GFLOPS >> tmp.dat
   echo camnob-bvcwau-vnmwuo 768 1728 1152 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl287.py | grep GFLOPS >> tmp.dat
   echo amn-ua-num 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl288.py | grep GFLOPS >> tmp.dat
   echo mna-num-ua 23040 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl289.py | grep GFLOPS >> tmp.dat
   echo nam-unm-ua 25920 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl290.py | grep GFLOPS >> tmp.dat
   echo amn-ua-unm 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl291.py | grep GFLOPS >> tmp.dat
   echo amon-au-unom 48 97200 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl292.py | grep GFLOPS >> tmp.dat
   echo mnao-unom-au 97200 40 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl293.py | grep GFLOPS >> tmp.dat
   echo onma-moun-au 103680 40 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl294.py | grep GFLOPS >> tmp.dat
   echo noma-moun-au 103680 40 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl295.py | grep GFLOPS >> tmp.dat
   echo aonpm-ua-nupom 24 192000 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl296.py | grep GFLOPS >> tmp.dat
   echo onmap-nupom-ua 230400 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl297.py | grep GFLOPS >> tmp.dat
   echo ponma-uomnp-ua 192000 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl298.py | grep GFLOPS >> tmp.dat
   echo ampno-ua-uomnp 24 160000 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl299.py | grep GFLOPS >> tmp.dat
   echo pqanmo-umnoqp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl300.py | grep GFLOPS >> tmp.dat
   echo mponaq-umnoqp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl301.py | grep GFLOPS >> tmp.dat
   echo qnopam-umqonp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl302.py | grep GFLOPS >> tmp.dat
   echo mopqna-umqonp-au 331776 8 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl303.py | grep GFLOPS >> tmp.dat
   echo bma-bau-mu 25920 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl304.py | grep GFLOPS >> tmp.dat
   echo mab-mu-bau 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl305.py | grep GFLOPS >> tmp.dat
   echo bma-bau-um 25920 160 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl306.py | grep GFLOPS >> tmp.dat
   echo mab-um-bau 144 25600 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl307.py | grep GFLOPS >> tmp.dat
   echo ambn-bua-umn 2304 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl308.py | grep GFLOPS >> tmp.dat
   echo anmb-bua-umn 2304 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl309.py | grep GFLOPS >> tmp.dat
   echo amnb-bua-nmu 2304 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl310.py | grep GFLOPS >> tmp.dat
   echo bman-bua-nmu 2160 2160 1944 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl311.py | grep GFLOPS >> tmp.dat
   echo ma-mvu-auv 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl312.py | grep GFLOPS >> tmp.dat
   echo am-auv-mvu 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl313.py | grep GFLOPS >> tmp.dat
   echo ma-vmu-auv 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl314.py | grep GFLOPS >> tmp.dat
   echo am-auv-vmu 144 160 25600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl315.py | grep GFLOPS >> tmp.dat
   echo anomb-uab-monu 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl316.py | grep GFLOPS >> tmp.dat
   echo ombna-monu-uab 11520 400 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl317.py | grep GFLOPS >> tmp.dat
   echo bmaon-uab-nmuo 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl318.py | grep GFLOPS >> tmp.dat
   echo noamb-nmuo-uab 9600 400 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl319.py | grep GFLOPS >> tmp.dat
   echo nam-nuvm-vua 2160 1944 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl320.py | grep GFLOPS >> tmp.dat
   echo anm-vua-nuvm 1944 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl321.py | grep GFLOPS >> tmp.dat
   echo mna-unmv-vua 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl322.py | grep GFLOPS >> tmp.dat
   echo man-unmv-vua 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl323.py | grep GFLOPS >> tmp.dat
   echo omnapb-upmon-uba 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl324.py | grep GFLOPS >> tmp.dat
   echo apnobm-uba-upmon 192 20736 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl325.py | grep GFLOPS >> tmp.dat
   echo opamnb-umonp-uba 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl326.py | grep GFLOPS >> tmp.dat
   echo mnaobp-umonp-uba 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl327.py | grep GFLOPS >> tmp.dat
   echo amon-auv-uovnm 432 8000 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl328.py | grep GFLOPS >> tmp.dat
   echo mnoa-uovnm-auv 9600 432 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl329.py | grep GFLOPS >> tmp.dat
   echo oamn-numov-auv 11520 432 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl330.py | grep GFLOPS >> tmp.dat
   echo naom-numov-auv 9600 432 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl331.py | grep GFLOPS >> tmp.dat
   echo poanm-vunomp-auv 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl332.py | grep GFLOPS >> tmp.dat
   echo opmna-vunomp-auv 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl333.py | grep GFLOPS >> tmp.dat
   echo pmnoa-vonpum-auv 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl334.py | grep GFLOPS >> tmp.dat
   echo anomp-auv-vonpum 144 20736 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl335.py | grep GFLOPS >> tmp.dat
   echo bcam-cbua-um 103680 48 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl336.py | grep GFLOPS >> tmp.dat
   echo abcm-cbua-um 103680 48 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl337.py | grep GFLOPS >> tmp.dat
   echo cmab-cbua-mu 97200 40 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl338.py | grep GFLOPS >> tmp.dat
   echo mbac-mu-cbua 48 97200 45 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl339.py | grep GFLOPS >> tmp.dat
   echo bancm-aucb-mnu 11520 480 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl340.py | grep GFLOPS >> tmp.dat
   echo ancmb-aucb-mnu 9600 480 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl341.py | grep GFLOPS >> tmp.dat
   echo nmcab-num-aucb 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl342.py | grep GFLOPS >> tmp.dat
   echo nbamc-num-aucb 480 9600 432 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl343.py | grep GFLOPS >> tmp.dat
   echo abm-vaub-uvm 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl344.py | grep GFLOPS >> tmp.dat
   echo bam-vaub-uvm 2160 1944 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl345.py | grep GFLOPS >> tmp.dat
   echo abm-vaub-muv 2160 1944 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl346.py | grep GFLOPS >> tmp.dat
   echo bam-vaub-muv 2160 1944 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl347.py | grep GFLOPS >> tmp.dat
   echo baocmn-cbua-nmuo 3072 2304 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl348.py | grep GFLOPS >> tmp.dat
   echo nbcamo-nmuo-cbua 2304 2304 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl349.py | grep GFLOPS >> tmp.dat
   echo bcnaom-cbua-umno 3072 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl350.py | grep GFLOPS >> tmp.dat
   echo aonmbc-cbua-umno 3072 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl351.py | grep GFLOPS >> tmp.dat
   echo bnam-uvab-nvmu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl352.py | grep GFLOPS >> tmp.dat
   echo amnb-uvab-nvmu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl353.py | grep GFLOPS >> tmp.dat
   echo anmb-uvab-mnvu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl354.py | grep GFLOPS >> tmp.dat
   echo bnma-uvab-mnvu 2160 2160 2160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl355.py | grep GFLOPS >> tmp.dat
   echo ma-uvwm-uawv 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl356.py | grep GFLOPS >> tmp.dat
   echo am-uawv-uvwm 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl357.py | grep GFLOPS >> tmp.dat
   echo ma-uwmv-uawv 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl358.py | grep GFLOPS >> tmp.dat
   echo am-uawv-uwmv 48 48 97200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl359.py | grep GFLOPS >> tmp.dat
   echo nabmo-uvmno-vaub 9600 400 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl360.py | grep GFLOPS >> tmp.dat
   echo nboam-uvmno-vaub 9600 400 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl361.py | grep GFLOPS >> tmp.dat
   echo nobam-mnuov-vaub 11520 400 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl362.py | grep GFLOPS >> tmp.dat
   echo mbnao-mnuov-vaub 9600 400 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl363.py | grep GFLOPS >> tmp.dat
   echo nma-vwmnu-wvau 480 432 11520 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl364.py | grep GFLOPS >> tmp.dat
   echo nam-vwmnu-wvau 480 432 11520 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl365.py | grep GFLOPS >> tmp.dat
   echo mna-wmvun-wvau 480 432 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl366.py | grep GFLOPS >> tmp.dat
   echo nma-wmvun-wvau 480 432 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl367.py | grep GFLOPS >> tmp.dat
   echo manbop-pvnuom-ubva 36864 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl368.py | grep GFLOPS >> tmp.dat
   echo boanpm-ubva-pvnuom 96 27648 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl369.py | grep GFLOPS >> tmp.dat
   echo obnpam-punvom-ubva 36864 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl370.py | grep GFLOPS >> tmp.dat
   echo apmnbo-ubva-punvom 96 27648 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl371.py | grep GFLOPS >> tmp.dat
   echo mnoa-vomwnu-wavu 2304 1800 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl372.py | grep GFLOPS >> tmp.dat
   echo anmo-wavu-vomwnu 1800 1728 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl373.py | grep GFLOPS >> tmp.dat
   echo oanm-muonvw-wavu 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl374.py | grep GFLOPS >> tmp.dat
   echo nmao-muonvw-wavu 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl375.py | grep GFLOPS >> tmp.dat
   echo mdbac-mu-budca 24 192000 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl376.py | grep GFLOPS >> tmp.dat
   echo dabcm-budca-mu 230400 24 20 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl377.py | grep GFLOPS >> tmp.dat
   echo bmdac-budca-um 192000 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl378.py | grep GFLOPS >> tmp.dat
   echo dbamc-budca-um 230400 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl379.py | grep GFLOPS >> tmp.dat
   echo camdnb-cubad-unm 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl380.py | grep GFLOPS >> tmp.dat
   echo nacdmb-unm-cubad 192 27648 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl381.py | grep GFLOPS >> tmp.dat
   echo cdmbna-cubad-umn 27648 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl382.py | grep GFLOPS >> tmp.dat
   echo ambdcn-cubad-umn 36864 144 144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl383.py | grep GFLOPS >> tmp.dat
   echo bamc-uacbv-vum 9600 432 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl384.py | grep GFLOPS >> tmp.dat
   echo bmca-uacbv-vum 9600 432 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl385.py | grep GFLOPS >> tmp.dat
   echo cabm-uacbv-muv 9600 432 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl386.py | grep GFLOPS >> tmp.dat
   echo bcam-uacbv-muv 9600 432 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl387.py | grep GFLOPS >> tmp.dat
   echo mnacb-nvmu-abvuc 576 9600 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl388.py | grep GFLOPS >> tmp.dat
   echo namcb-nvmu-abvuc 480 9600 400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl389.py | grep GFLOPS >> tmp.dat
   echo mcnba-vmnu-abvuc 480 9600 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl390.py | grep GFLOPS >> tmp.dat
   echo cbman-abvuc-vmnu 11520 400 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl391.py | grep GFLOPS >> tmp.dat
   echo amb-avubw-muwv 480 432 8000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl392.py | grep GFLOPS >> tmp.dat
   echo mab-muwv-avubw 432 480 8000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl393.py | grep GFLOPS >> tmp.dat
   echo abm-avubw-umvw 480 432 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl394.py | grep GFLOPS >> tmp.dat
   echo mab-umvw-avubw 432 480 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl395.py | grep GFLOPS >> tmp.dat
   echo nboamc-muonv-avbuc 3072 2304 2025 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl396.py | grep GFLOPS >> tmp.dat
   echo ocabnm-muonv-avbuc 3072 2304 2025 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl397.py | grep GFLOPS >> tmp.dat
   echo bcnaom-avbuc-vmuon 3072 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl398.py | grep GFLOPS >> tmp.dat
   echo aocmnb-avbuc-vmuon 2304 1728 1800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl399.py | grep GFLOPS >> tmp.dat
   echo nabm-uwnmv-awuvb 480 480 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl400.py | grep GFLOPS >> tmp.dat
   echo bamn-awuvb-uwnmv 576 400 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl401.py | grep GFLOPS >> tmp.dat
   echo anbm-awuvb-wmvnu 480 400 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl402.py | grep GFLOPS >> tmp.dat
   echo nbam-wmvnu-awuvb 480 480 9600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl403.py | grep GFLOPS >> tmp.dat
   echo mnoba-wnmvou-vuabw 2304 2160 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl404.py | grep GFLOPS >> tmp.dat
   echo amonb-vuabw-wnmvou 1800 1728 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl405.py | grep GFLOPS >> tmp.dat
   echo obman-monuvw-vuabw 3072 2160 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl406.py | grep GFLOPS >> tmp.dat
   echo mbnoa-monuvw-vuabw 2304 2160 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl407.py | grep GFLOPS >> tmp.dat
   echo mbcdea-um-budaec 24 331776 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl408.py | grep GFLOPS >> tmp.dat
   echo mbaced-um-budaec 24 331776 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl409.py | grep GFLOPS >> tmp.dat
   echo ebdcma-budaec-mu 442368 8 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl410.py | grep GFLOPS >> tmp.dat
   echo mcabed-mu-budaec 24 331776 12 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl411.py | grep GFLOPS >> tmp.dat
   echo dcamb-ubacvd-uvm 27648 128 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl412.py | grep GFLOPS >> tmp.dat
   echo mbcad-uvm-ubacvd 144 20736 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl413.py | grep GFLOPS >> tmp.dat
   echo ambdc-ubacvd-mvu 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl414.py | grep GFLOPS >> tmp.dat
   echo adbmc-ubacvd-mvu 27648 144 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl415.py | grep GFLOPS >> tmp.dat
   echo cbamdn-ubvcda-muvn 27648 96 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl416.py | grep GFLOPS >> tmp.dat
   echo acmndb-ubvcda-muvn 27648 96 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl417.py | grep GFLOPS >> tmp.dat
   echo bdmacn-ubvcda-vnmu 27648 144 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl418.py | grep GFLOPS >> tmp.dat
   echo dmabnc-ubvcda-vnmu 27648 144 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl419.py | grep GFLOPS >> tmp.dat
   echo mcab-vmuw-acvwub 1800 2304 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl420.py | grep GFLOPS >> tmp.dat
   echo amcb-acvwub-vmuw 2304 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl421.py | grep GFLOPS >> tmp.dat
   echo cmab-acvwub-wmuv 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl422.py | grep GFLOPS >> tmp.dat
   echo camb-acvwub-wmuv 3072 1800 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl423.py | grep GFLOPS >> tmp.dat
   echo cnamb-bacwuv-wvmnu 3072 2160 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl424.py | grep GFLOPS >> tmp.dat
   echo mbnca-wvmnu-bacwuv 1800 2304 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl425.py | grep GFLOPS >> tmp.dat
   echo amcnb-bacwuv-mwvnu 3072 1800 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl426.py | grep GFLOPS >> tmp.dat
   echo ncabm-mwvnu-bacwuv 1920 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl427.py | grep GFLOPS >> tmp.dat
   echo conbma-avucwb-munwov 3072 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl428.py | grep GFLOPS >> tmp.dat
   echo ambcon-avucwb-munwov 2304 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl429.py | grep GFLOPS >> tmp.dat
   echo nmcoab-owunvm-avucwb 3072 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl430.py | grep GFLOPS >> tmp.dat
   echo nocamb-owunvm-avucwb 3072 2304 1728 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl431.py | grep GFLOPS >> tmp.dat
   echo anm-au-umn 192 36864 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl432.py | grep GFLOPS >> tmp.dat
   echo man-umn-au 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl433.py | grep GFLOPS >> tmp.dat
   echo nam-mnu-au 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl434.py | grep GFLOPS >> tmp.dat
   echo man-mnu-au 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl435.py | grep GFLOPS >> tmp.dat
   echo amno-ua-muon 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl436.py | grep GFLOPS >> tmp.dat
   echo aomn-ua-muon 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl437.py | grep GFLOPS >> tmp.dat
   echo aomn-ua-noum 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl438.py | grep GFLOPS >> tmp.dat
   echo amon-ua-noum 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl439.py | grep GFLOPS >> tmp.dat
   echo pmoan-oumnp-au 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl440.py | grep GFLOPS >> tmp.dat
   echo apnom-au-oumnp 24 331776 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl441.py | grep GFLOPS >> tmp.dat
   echo npmao-nmuop-au 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl442.py | grep GFLOPS >> tmp.dat
   echo nompa-nmuop-au 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl443.py | grep GFLOPS >> tmp.dat
   echo oqpman-muopqn-au 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl444.py | grep GFLOPS >> tmp.dat
   echo mponaq-muopqn-au 810000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl445.py | grep GFLOPS >> tmp.dat
   echo qpmano-qompun-au 810000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl446.py | grep GFLOPS >> tmp.dat
   echo maqnop-qompun-au 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl447.py | grep GFLOPS >> tmp.dat
   echo bma-uab-mu 36864 192 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl448.py | grep GFLOPS >> tmp.dat
   echo mba-mu-uab 192 36864 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl449.py | grep GFLOPS >> tmp.dat
   echo bma-uab-um 36864 180 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl450.py | grep GFLOPS >> tmp.dat
   echo amb-uab-um 36864 180 192 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl451.py | grep GFLOPS >> tmp.dat
   echo abmn-aub-nmu 2400 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl452.py | grep GFLOPS >> tmp.dat
   echo amnb-aub-nmu 2400 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl453.py | grep GFLOPS >> tmp.dat
   echo nbam-mnu-aub 2304 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl454.py | grep GFLOPS >> tmp.dat
   echo nmba-mnu-aub 2304 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl455.py | grep GFLOPS >> tmp.dat
   echo am-auv-vum 192 180 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl456.py | grep GFLOPS >> tmp.dat
   echo ma-vum-auv 192 192 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl457.py | grep GFLOPS >> tmp.dat
   echo ma-mvu-auv 192 192 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl458.py | grep GFLOPS >> tmp.dat
   echo am-auv-mvu 192 192 36864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl459.py | grep GFLOPS >> tmp.dat
   echo manbo-monu-uab 13824 576 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl460.py | grep GFLOPS >> tmp.dat
   echo aombn-uab-monu 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl461.py | grep GFLOPS >> tmp.dat
   echo nmbao-nuom-uab 13824 576 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl462.py | grep GFLOPS >> tmp.dat
   echo anobm-uab-nuom 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl463.py | grep GFLOPS >> tmp.dat
   echo amn-uav-nuvm 2592 2400 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl464.py | grep GFLOPS >> tmp.dat
   echo man-nuvm-uav 2304 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl465.py | grep GFLOPS >> tmp.dat
   echo anm-uav-vnum 2592 2500 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl466.py | grep GFLOPS >> tmp.dat
   echo amn-uav-vnum 2592 2500 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl467.py | grep GFLOPS >> tmp.dat
   echo bmnoap-abu-monpu 384 54000 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl468.py | grep GFLOPS >> tmp.dat
   echo pnbaom-monpu-abu 57600 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl469.py | grep GFLOPS >> tmp.dat
   echo obmnap-unmop-abu 54000 240 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl470.py | grep GFLOPS >> tmp.dat
   echo mbonpa-unmop-abu 54000 240 160 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl471.py | grep GFLOPS >> tmp.dat
   echo moan-mvnou-vua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl472.py | grep GFLOPS >> tmp.dat
   echo anmo-vua-mvnou 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl473.py | grep GFLOPS >> tmp.dat
   echo mnoa-nvmuo-vua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl474.py | grep GFLOPS >> tmp.dat
   echo namo-nvmuo-vua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl475.py | grep GFLOPS >> tmp.dat
   echo npoam-onmpvu-auv 57600 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl476.py | grep GFLOPS >> tmp.dat
   echo oanpm-onmpvu-auv 54000 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl477.py | grep GFLOPS >> tmp.dat
   echo anomp-auv-mounpv 144 54000 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl478.py | grep GFLOPS >> tmp.dat
   echo pamno-mounpv-auv 57600 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl479.py | grep GFLOPS >> tmp.dat
   echo mbca-um-cbau 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl480.py | grep GFLOPS >> tmp.dat
   echo mcab-um-cbau 48 120000 48 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl481.py | grep GFLOPS >> tmp.dat
   echo cabm-cbau-mu 120000 48 50 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl482.py | grep GFLOPS >> tmp.dat
   echo bmac-cbau-mu 115200 48 50 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl483.py | grep GFLOPS >> tmp.dat
   echo mabnc-nmu-aucb 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl484.py | grep GFLOPS >> tmp.dat
   echo mbnac-nmu-aucb 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl485.py | grep GFLOPS >> tmp.dat
   echo acmbn-aucb-umn 13824 576 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl486.py | grep GFLOPS >> tmp.dat
   echo mcabn-umn-aucb 576 13824 480 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl487.py | grep GFLOPS >> tmp.dat
   echo abm-aubv-mvu 2400 2560 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl488.py | grep GFLOPS >> tmp.dat
   echo bma-aubv-mvu 2304 2560 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl489.py | grep GFLOPS >> tmp.dat
   echo bam-aubv-vmu 2304 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl490.py | grep GFLOPS >> tmp.dat
   echo amb-aubv-vmu 2400 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl491.py | grep GFLOPS >> tmp.dat
   echo mobanc-umno-acbu 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl492.py | grep GFLOPS >> tmp.dat
   echo ombnca-umno-acbu 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl493.py | grep GFLOPS >> tmp.dat
   echo ocanbm-umon-acbu 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl494.py | grep GFLOPS >> tmp.dat
   echo ambnco-acbu-umon 3600 3600 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl495.py | grep GFLOPS >> tmp.dat
   echo abmn-avub-unvm 2400 2500 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl496.py | grep GFLOPS >> tmp.dat
   echo nabm-unvm-avub 2400 2400 2400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl497.py | grep GFLOPS >> tmp.dat
   echo mnab-nuvm-avub 2304 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl498.py | grep GFLOPS >> tmp.dat
   echo abmn-avub-nuvm 2400 2400 2500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl499.py | grep GFLOPS >> tmp.dat
   echo am-vwua-mvuw 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl500.py | grep GFLOPS >> tmp.dat
   echo am-vwua-muwv 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl501.py | grep GFLOPS >> tmp.dat
   echo am-vwua-mwvu 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl502.py | grep GFLOPS >> tmp.dat
   echo am-uvwa-mvuw 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl503.py | grep GFLOPS >> tmp.dat
   echo am-uvwa-muwv 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl504.py | grep GFLOPS >> tmp.dat
   echo am-uvwa-mwvu 48 48 120000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl505.py | grep GFLOPS >> tmp.dat
   echo anomb-bvua-numov 576 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl506.py | grep GFLOPS >> tmp.dat
   echo bomna-bvua-numov 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl507.py | grep GFLOPS >> tmp.dat
   echo nmbao-ovmnu-bvua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl508.py | grep GFLOPS >> tmp.dat
   echo naobm-ovmnu-bvua 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl509.py | grep GFLOPS >> tmp.dat
   echo amn-awvu-wmuvn 480 576 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl510.py | grep GFLOPS >> tmp.dat
   echo man-wmuvn-awvu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl511.py | grep GFLOPS >> tmp.dat
   echo man-unwmv-awvu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl512.py | grep GFLOPS >> tmp.dat
   echo nma-unwmv-awvu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl513.py | grep GFLOPS >> tmp.dat
   echo naobpm-pnvomu-aubv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl514.py | grep GFLOPS >> tmp.dat
   echo bamnpo-aubv-pnvomu 384 54000 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl515.py | grep GFLOPS >> tmp.dat
   echo pomabn-nvuopm-aubv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl516.py | grep GFLOPS >> tmp.dat
   echo pobmna-nvuopm-aubv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl517.py | grep GFLOPS >> tmp.dat
   echo aomn-vwua-nmuwov 2400 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl518.py | grep GFLOPS >> tmp.dat
   echo onam-nmuwov-vwua 3840 2400 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl519.py | grep GFLOPS >> tmp.dat
   echo amon-vwua-uvnomw 2400 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl520.py | grep GFLOPS >> tmp.dat
   echo mnao-uvnomw-vwua 3600 2400 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl521.py | grep GFLOPS >> tmp.dat
   echo dmabc-budac-mu 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl522.py | grep GFLOPS >> tmp.dat
   echo amcbd-budac-mu 331776 16 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl523.py | grep GFLOPS >> tmp.dat
   echo amdbc-budac-um 331776 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl524.py | grep GFLOPS >> tmp.dat
   echo ambcd-budac-um 331776 20 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl525.py | grep GFLOPS >> tmp.dat
   echo bmcand-budac-mun 54000 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl526.py | grep GFLOPS >> tmp.dat
   echo bcandm-budac-mun 54000 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl527.py | grep GFLOPS >> tmp.dat
   echo bmcdna-budac-mnu 54000 240 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl528.py | grep GFLOPS >> tmp.dat
   echo ncdmab-mnu-budac 384 54000 162 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl529.py | grep GFLOPS >> tmp.dat
   echo abcm-cbvau-uvm 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl530.py | grep GFLOPS >> tmp.dat
   echo cmba-cbvau-uvm 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl531.py | grep GFLOPS >> tmp.dat
   echo bmca-cbvau-vmu 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl532.py | grep GFLOPS >> tmp.dat
   echo bacm-cbvau-vmu 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl533.py | grep GFLOPS >> tmp.dat
   echo nacmb-vnmu-vcaub 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl534.py | grep GFLOPS >> tmp.dat
   echo macnb-vnmu-vcaub 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl535.py | grep GFLOPS >> tmp.dat
   echo nacmb-numv-vcaub 480 13824 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl536.py | grep GFLOPS >> tmp.dat
   echo acnbm-vcaub-numv 13824 480 576 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl537.py | grep GFLOPS >> tmp.dat
   echo bam-abvuw-vwmu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl538.py | grep GFLOPS >> tmp.dat
   echo bma-abvuw-vwmu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl539.py | grep GFLOPS >> tmp.dat
   echo bma-abvuw-vmwu 576 480 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl540.py | grep GFLOPS >> tmp.dat
   echo mba-vmwu-abvuw 480 576 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl541.py | grep GFLOPS >> tmp.dat
   echo canbom-vubac-ovmnu 3600 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl542.py | grep GFLOPS >> tmp.dat
   echo namobc-ovmnu-vubac 3840 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl543.py | grep GFLOPS >> tmp.dat
   echo cbmoan-vubac-uonvm 3600 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl544.py | grep GFLOPS >> tmp.dat
   echo bmoanc-vubac-uonvm 3600 3600 2304 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl545.py | grep GFLOPS >> tmp.dat
   echo namb-wunvm-vwaub 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl546.py | grep GFLOPS >> tmp.dat
   echo banm-vwaub-wunvm 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl547.py | grep GFLOPS >> tmp.dat
   echo nbam-vnmuw-vwaub 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl548.py | grep GFLOPS >> tmp.dat
   echo mnba-vnmuw-vwaub 576 400 13824 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl549.py | grep GFLOPS >> tmp.dat
   echo nbaom-uwvmon-vbwua 3600 2304 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl550.py | grep GFLOPS >> tmp.dat
   echo bmano-vbwua-uwvmon 2304 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl551.py | grep GFLOPS >> tmp.dat
   echo mnoab-mownvu-vbwua 3600 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl552.py | grep GFLOPS >> tmp.dat
   echo nmboa-mownvu-vbwua 3840 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl553.py | grep GFLOPS >> tmp.dat
   echo adbemc-dabuec-um 864000 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl554.py | grep GFLOPS >> tmp.dat
   echo dcmeba-dabuec-um 810000 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl555.py | grep GFLOPS >> tmp.dat
   echo cmeadb-dabuec-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl556.py | grep GFLOPS >> tmp.dat
   echo bmcaed-dabuec-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl557.py | grep GFLOPS >> tmp.dat
   echo mdacb-umv-bcvuad 144 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl558.py | grep GFLOPS >> tmp.dat
   echo mdbac-umv-bcvuad 144 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl559.py | grep GFLOPS >> tmp.dat
   echo acmdb-bcvuad-muv 57600 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl560.py | grep GFLOPS >> tmp.dat
   echo bdmca-bcvuad-muv 54000 160 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl561.py | grep GFLOPS >> tmp.dat
   echo mcanbd-vmnu-bacdvu 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl562.py | grep GFLOPS >> tmp.dat
   echo dcanbm-bacdvu-vmnu 57600 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl563.py | grep GFLOPS >> tmp.dat
   echo cambdn-bacdvu-mnuv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl564.py | grep GFLOPS >> tmp.dat
   echo adnbmc-bacdvu-mnuv 57600 240 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl565.py | grep GFLOPS >> tmp.dat
   echo bacm-cbvuaw-wmuv 3840 2400 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl566.py | grep GFLOPS >> tmp.dat
   echo bcma-cbvuaw-wmuv 3840 2400 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl567.py | grep GFLOPS >> tmp.dat
   echo mabc-mvwu-cbvuaw 2400 3600 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl568.py | grep GFLOPS >> tmp.dat
   echo cmab-cbvuaw-mvwu 3600 2400 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl569.py | grep GFLOPS >> tmp.dat
   echo bnacm-wcaubv-numvw 3600 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl570.py | grep GFLOPS >> tmp.dat
   echo bnamc-wcaubv-numvw 3600 2304 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl571.py | grep GFLOPS >> tmp.dat
   echo ncmba-vnuwm-wcaubv 2304 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl572.py | grep GFLOPS >> tmp.dat
   echo mcnba-vnuwm-wcaubv 2304 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl573.py | grep GFLOPS >> tmp.dat
   echo anmocb-bcawvu-mnouvw 3840 3600 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl574.py | grep GFLOPS >> tmp.dat
   echo ancmob-bcawvu-mnouvw 3840 3600 3375 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl575.py | grep GFLOPS >> tmp.dat
   echo bmoanc-bcawvu-uonmvw 3600 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl576.py | grep GFLOPS >> tmp.dat
   echo ncomab-uonmvw-bcawvu 3600 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl577.py | grep GFLOPS >> tmp.dat
   echo anm-au-umn 216 46656 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl578.py | grep GFLOPS >> tmp.dat
   echo nma-umn-au 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl579.py | grep GFLOPS >> tmp.dat
   echo nma-mnu-au 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl580.py | grep GFLOPS >> tmp.dat
   echo nam-mnu-au 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl581.py | grep GFLOPS >> tmp.dat
   echo anmo-ua-muno 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl582.py | grep GFLOPS >> tmp.dat
   echo aonm-ua-muno 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl583.py | grep GFLOPS >> tmp.dat
   echo anom-ua-onmu 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl584.py | grep GFLOPS >> tmp.dat
   echo amno-ua-onmu 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl585.py | grep GFLOPS >> tmp.dat
   echo pnmao-mnopu-au 360000 24 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl586.py | grep GFLOPS >> tmp.dat
   echo pmona-mnopu-au 360000 24 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl587.py | grep GFLOPS >> tmp.dat
   echo maopn-monup-au 375000 24 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl588.py | grep GFLOPS >> tmp.dat
   echo aopnm-au-monup 24 375000 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl589.py | grep GFLOPS >> tmp.dat
   echo mqnoap-ompunq-ua 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl590.py | grep GFLOPS >> tmp.dat
   echo qpmnao-ompunq-ua 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl591.py | grep GFLOPS >> tmp.dat
   echo onqpma-upnmqo-ua 810000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl592.py | grep GFLOPS >> tmp.dat
   echo mnopqa-upnmqo-ua 810000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl593.py | grep GFLOPS >> tmp.dat
   echo bam-aub-um 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl594.py | grep GFLOPS >> tmp.dat
   echo amb-aub-um 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl595.py | grep GFLOPS >> tmp.dat
   echo bma-aub-mu 46656 216 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl596.py | grep GFLOPS >> tmp.dat
   echo mba-mu-aub 216 46656 216 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl597.py | grep GFLOPS >> tmp.dat
   echo bmna-aub-num 4608 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl598.py | grep GFLOPS >> tmp.dat
   echo mnab-num-aub 4608 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl599.py | grep GFLOPS >> tmp.dat
   echo nbam-nmu-aub 3456 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl600.py | grep GFLOPS >> tmp.dat
   echo bnam-aub-nmu 4608 3456 3240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl601.py | grep GFLOPS >> tmp.dat
   echo ma-vmu-vua 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl602.py | grep GFLOPS >> tmp.dat
   echo am-vua-vmu 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl603.py | grep GFLOPS >> tmp.dat
   echo am-vua-uvm 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl604.py | grep GFLOPS >> tmp.dat
   echo ma-uvm-vua 216 216 46656 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl605.py | grep GFLOPS >> tmp.dat
   echo maobn-mnuo-bua 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl606.py | grep GFLOPS >> tmp.dat
   echo nboma-mnuo-bua 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl607.py | grep GFLOPS >> tmp.dat
   echo oambn-uonm-bua 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl608.py | grep GFLOPS >> tmp.dat
   echo nboma-uonm-bua 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl609.py | grep GFLOPS >> tmp.dat
   echo man-mnvu-auv 3456 3240 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl610.py | grep GFLOPS >> tmp.dat
   echo anm-auv-mnvu 3240 3456 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl611.py | grep GFLOPS >> tmp.dat
   echo mna-vunm-auv 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl612.py | grep GFLOPS >> tmp.dat
   echo amn-auv-vunm 3240 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl613.py | grep GFLOPS >> tmp.dat
   echo manpbo-uopnm-uba 54000 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl614.py | grep GFLOPS >> tmp.dat
   echo mpobna-uopnm-uba 54000 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl615.py | grep GFLOPS >> tmp.dat
   echo bonmap-uba-omnpu 240 54000 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl616.py | grep GFLOPS >> tmp.dat
   echo nmbpoa-omnpu-uba 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl617.py | grep GFLOPS >> tmp.dat
   echo onma-unvom-uva 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl618.py | grep GFLOPS >> tmp.dat
   echo noam-unvom-uva 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl619.py | grep GFLOPS >> tmp.dat
   echo noam-omunv-uva 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl620.py | grep GFLOPS >> tmp.dat
   echo amno-uva-omunv 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl621.py | grep GFLOPS >> tmp.dat
   echo pnaom-nupvmo-uav 57600 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl622.py | grep GFLOPS >> tmp.dat
   echo nopma-nupvmo-uav 54000 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl623.py | grep GFLOPS >> tmp.dat
   echo nmoap-noumvp-uav 54000 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl624.py | grep GFLOPS >> tmp.dat
   echo mopna-noumvp-uav 57600 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl625.py | grep GFLOPS >> tmp.dat
   echo acmb-aubc-mu 186624 64 54 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl626.py | grep GFLOPS >> tmp.dat
   echo camb-aubc-mu 221184 64 54 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl627.py | grep GFLOPS >> tmp.dat
   echo mcba-um-aubc 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl628.py | grep GFLOPS >> tmp.dat
   echo mbac-um-aubc 72 186624 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl629.py | grep GFLOPS >> tmp.dat
   echo cabmn-bacu-nmu 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl630.py | grep GFLOPS >> tmp.dat
   echo bmnca-bacu-nmu 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl631.py | grep GFLOPS >> tmp.dat
   echo nbmca-mun-bacu 576 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl632.py | grep GFLOPS >> tmp.dat
   echo cabnm-bacu-mun 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl633.py | grep GFLOPS >> tmp.dat
   echo amb-auvb-umv 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl634.py | grep GFLOPS >> tmp.dat
   echo abm-auvb-umv 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl635.py | grep GFLOPS >> tmp.dat
   echo mba-vum-auvb 3240 3456 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl636.py | grep GFLOPS >> tmp.dat
   echo amb-auvb-vum 3456 3240 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl637.py | grep GFLOPS >> tmp.dat
   echo ocmban-unom-abcu 3600 3600 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl638.py | grep GFLOPS >> tmp.dat
   echo ocnbam-unom-abcu 3600 3600 3072 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl639.py | grep GFLOPS >> tmp.dat
   echo oacnmb-omun-abcu 3600 3600 3125 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl640.py | grep GFLOPS >> tmp.dat
   echo amncob-abcu-omun 3600 3600 3125 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl641.py | grep GFLOPS >> tmp.dat
   echo anbm-vuab-vmnu 3456 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl642.py | grep GFLOPS >> tmp.dat
   echo bman-vuab-vmnu 3456 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl643.py | grep GFLOPS >> tmp.dat
   echo anmb-vuab-mnuv 3456 3456 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl644.py | grep GFLOPS >> tmp.dat
   echo nbma-mnuv-vuab 4608 2916 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl645.py | grep GFLOPS >> tmp.dat
   echo am-wuva-mvuw 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl646.py | grep GFLOPS >> tmp.dat
   echo am-wuva-mwvu 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl647.py | grep GFLOPS >> tmp.dat
   echo am-wuva-muwv 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl648.py | grep GFLOPS >> tmp.dat
   echo am-uvwa-mwvu 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl649.py | grep GFLOPS >> tmp.dat
   echo am-uvwa-mvuw 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl650.py | grep GFLOPS >> tmp.dat
   echo am-uvwa-muwv 72 64 186624 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl651.py | grep GFLOPS >> tmp.dat
   echo aonmb-vbau-mouvn 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl652.py | grep GFLOPS >> tmp.dat
   echo bmnao-vbau-mouvn 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl653.py | grep GFLOPS >> tmp.dat
   echo nmboa-vomnu-vbau 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl654.py | grep GFLOPS >> tmp.dat
   echo anobm-vbau-vomnu 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl655.py | grep GFLOPS >> tmp.dat
   echo anm-uvaw-vumnw 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl656.py | grep GFLOPS >> tmp.dat
   echo nma-vumnw-uvaw 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl657.py | grep GFLOPS >> tmp.dat
   echo mna-wvnmu-uvaw 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl658.py | grep GFLOPS >> tmp.dat
   echo amn-uvaw-wvnmu 600 600 14400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl659.py | grep GFLOPS >> tmp.dat
   echo mpbnoa-vopmun-vabu 54000 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl660.py | grep GFLOPS >> tmp.dat
   echo bnampo-vabu-vopmun 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl661.py | grep GFLOPS >> tmp.dat
   echo baompn-vabu-vpuonm 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl662.py | grep GFLOPS >> tmp.dat
   echo bnoapm-vabu-vpuonm 240 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl663.py | grep GFLOPS >> tmp.dat
   echo mnoa-onmwvu-uvwa 3840 3072 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl664.py | grep GFLOPS >> tmp.dat
   echo omna-onmwvu-uvwa 3600 3072 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl665.py | grep GFLOPS >> tmp.dat
   echo oamn-vonmwu-uvwa 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl666.py | grep GFLOPS >> tmp.dat
   echo namo-vonmwu-uvwa 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl667.py | grep GFLOPS >> tmp.dat
   echo cadbm-bcdua-um 360000 24 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl668.py | grep GFLOPS >> tmp.dat
   echo acmdb-bcdua-um 360000 24 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl669.py | grep GFLOPS >> tmp.dat
   echo mcadb-mu-bcdua 24 375000 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl670.py | grep GFLOPS >> tmp.dat
   echo mbadc-mu-bcdua 24 375000 25 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl671.py | grep GFLOPS >> tmp.dat
   echo dabmcn-caubd-mun 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl672.py | grep GFLOPS >> tmp.dat
   echo dabcnm-caubd-mun 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl673.py | grep GFLOPS >> tmp.dat
   echo mcbnda-unm-caubd 240 54000 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl674.py | grep GFLOPS >> tmp.dat
   echo abncdm-caubd-unm 57600 240 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl675.py | grep GFLOPS >> tmp.dat
   echo cbma-cabuv-vmu 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl676.py | grep GFLOPS >> tmp.dat
   echo cmba-cabuv-vmu 15000 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl677.py | grep GFLOPS >> tmp.dat
   echo macb-umv-cabuv 600 15000 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl678.py | grep GFLOPS >> tmp.dat
   echo amcb-cabuv-umv 14400 600 600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl679.py | grep GFLOPS >> tmp.dat
   echo mbacn-nvum-cbuva 576 15000 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl680.py | grep GFLOPS >> tmp.dat
   echo bcanm-cbuva-nvum 14400 600 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl681.py | grep GFLOPS >> tmp.dat
   echo bmcan-cbuva-nvmu 14400 600 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl682.py | grep GFLOPS >> tmp.dat
   echo nmcab-nvmu-cbuva 600 15000 625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl683.py | grep GFLOPS >> tmp.dat
   echo bma-avwbu-wumv 576 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl684.py | grep GFLOPS >> tmp.dat
   echo bam-avwbu-wumv 576 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl685.py | grep GFLOPS >> tmp.dat
   echo bam-avwbu-vmuw 576 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl686.py | grep GFLOPS >> tmp.dat
   echo mba-vmuw-avwbu 600 600 15000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl687.py | grep GFLOPS >> tmp.dat
   echo cmabno-cbvua-muvon 3600 3600 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl688.py | grep GFLOPS >> tmp.dat
   echo obcnma-muvon-cbvua 3840 3600 2916 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl689.py | grep GFLOPS >> tmp.dat
   echo obnacm-vnomu-cbvua 3600 3600 2592 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl690.py | grep GFLOPS >> tmp.dat
   echo bncmoa-cbvua-vnomu 3840 3600 2592 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl691.py | grep GFLOPS >> tmp.dat
   echo nmba-mnwuv-buwva 576 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl692.py | grep GFLOPS >> tmp.dat
   echo namb-mnwuv-buwva 576 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl693.py | grep GFLOPS >> tmp.dat
   echo anmb-buwva-mvnwu 576 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl694.py | grep GFLOPS >> tmp.dat
   echo manb-mvnwu-buwva 600 600 15625 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl695.py | grep GFLOPS >> tmp.dat
   echo bamon-ubwva-mnuvow 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl696.py | grep GFLOPS >> tmp.dat
   echo anomb-ubwva-mnuvow 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl697.py | grep GFLOPS >> tmp.dat
   echo bmano-ubwva-uvwomn 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl698.py | grep GFLOPS >> tmp.dat
   echo aonbm-ubwva-uvwomn 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl699.py | grep GFLOPS >> tmp.dat
   echo bmedac-cabdeu-um 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl700.py | grep GFLOPS >> tmp.dat
   echo aedmbc-cabdeu-um 864000 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl701.py | grep GFLOPS >> tmp.dat
   echo becdam-cabdeu-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl702.py | grep GFLOPS >> tmp.dat
   echo eadbcm-cabdeu-mu 864000 16 15 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl703.py | grep GFLOPS >> tmp.dat
   echo abdcm-cbaudv-muv 57600 200 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl704.py | grep GFLOPS >> tmp.dat
   echo dabcm-cbaudv-muv 57600 200 225 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl705.py | grep GFLOPS >> tmp.dat
   echo mbcda-umv-cbaudv 192 54000 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl706.py | grep GFLOPS >> tmp.dat
   echo bdmca-cbaudv-umv 57600 200 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl707.py | grep GFLOPS >> tmp.dat
   echo abnmdc-ubvcad-vmnu 54000 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl708.py | grep GFLOPS >> tmp.dat
   echo dabmcn-ubvcad-vmnu 54000 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl709.py | grep GFLOPS >> tmp.dat
   echo anmbcd-ubvcad-mnvu 54000 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl710.py | grep GFLOPS >> tmp.dat
   echo cdmban-ubvcad-mnvu 54000 240 240 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl711.py | grep GFLOPS >> tmp.dat
   echo bacm-wavcbu-vmwu 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl712.py | grep GFLOPS >> tmp.dat
   echo camb-wavcbu-vmwu 3600 3072 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl713.py | grep GFLOPS >> tmp.dat
   echo cabm-wavcbu-muwv 3600 3072 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl714.py | grep GFLOPS >> tmp.dat
   echo mcab-muwv-wavcbu 3072 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl715.py | grep GFLOPS >> tmp.dat
   echo cbnma-vwcuab-vunwm 3600 2916 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl716.py | grep GFLOPS >> tmp.dat
   echo namcb-vunwm-vwcuab 2592 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl717.py | grep GFLOPS >> tmp.dat
   echo cmbna-vwcuab-nwvmu 3600 2592 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl718.py | grep GFLOPS >> tmp.dat
   echo canbm-vwcuab-nwvmu 3600 2592 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl719.py | grep GFLOPS >> tmp.dat
   echo cmnboa-vwbuca-wnvmuo 3600 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl720.py | grep GFLOPS >> tmp.dat
   echo conbma-vwbuca-wnvmuo 3600 3600 3840 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl721.py | grep GFLOPS >> tmp.dat
   echo ncbamo-mwnuvo-vwbuca 3840 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl722.py | grep GFLOPS >> tmp.dat
   echo cbonam-vwbuca-mwnuvo 3600 3600 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl723.py | grep GFLOPS >> tmp.dat
   echo mna-num-ua 61440 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl724.py | grep GFLOPS >> tmp.dat
   echo amn-ua-num 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl725.py | grep GFLOPS >> tmp.dat
   echo anm-ua-mnu 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl726.py | grep GFLOPS >> tmp.dat
   echo man-mnu-ua 62208 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl727.py | grep GFLOPS >> tmp.dat
   echo oanm-unom-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl728.py | grep GFLOPS >> tmp.dat
   echo namo-unom-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl729.py | grep GFLOPS >> tmp.dat
   echo noam-mnuo-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl730.py | grep GFLOPS >> tmp.dat
   echo noma-mnuo-ua 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl731.py | grep GFLOPS >> tmp.dat
   echo panmo-mpoun-au 419904 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl732.py | grep GFLOPS >> tmp.dat
   echo maopn-mpoun-au 472392 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl733.py | grep GFLOPS >> tmp.dat
   echo npmao-nuomp-au 472392 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl734.py | grep GFLOPS >> tmp.dat
   echo poanm-nuomp-au 419904 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl735.py | grep GFLOPS >> tmp.dat
   echo pqaonm-qnoupm-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl736.py | grep GFLOPS >> tmp.dat
   echo qpanmo-qnoupm-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl737.py | grep GFLOPS >> tmp.dat
   echo mqpano-pqmuon-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl738.py | grep GFLOPS >> tmp.dat
   echo pnmoaq-pqmuon-au 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl739.py | grep GFLOPS >> tmp.dat
   echo mba-um-uab 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl740.py | grep GFLOPS >> tmp.dat
   echo bma-uab-um 62208 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl741.py | grep GFLOPS >> tmp.dat
   echo amb-uab-mu 62208 256 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl742.py | grep GFLOPS >> tmp.dat
   echo mba-mu-uab 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl743.py | grep GFLOPS >> tmp.dat
   echo bnma-bau-umn 3840 4096 4000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl744.py | grep GFLOPS >> tmp.dat
   echo mabn-umn-bau 3840 4096 4000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl745.py | grep GFLOPS >> tmp.dat
   echo mbna-num-bau 4608 4096 4050 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl746.py | grep GFLOPS >> tmp.dat
   echo mabn-num-bau 4608 4096 4050 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl747.py | grep GFLOPS >> tmp.dat
   echo am-uva-vmu 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl748.py | grep GFLOPS >> tmp.dat
   echo ma-vmu-uva 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl749.py | grep GFLOPS >> tmp.dat
   echo am-uva-vum 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl750.py | grep GFLOPS >> tmp.dat
   echo ma-vum-uva 240 256 65536 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl751.py | grep GFLOPS >> tmp.dat
   echo aobmn-uba-muno 648 17496 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl752.py | grep GFLOPS >> tmp.dat
   echo omabn-muno-uba 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl753.py | grep GFLOPS >> tmp.dat
   echo ambon-uba-nuom 648 17496 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl754.py | grep GFLOPS >> tmp.dat
   echo mnoab-nuom-uba 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl755.py | grep GFLOPS >> tmp.dat
   echo anm-avu-mnuv 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl756.py | grep GFLOPS >> tmp.dat
   echo nma-mnuv-avu 4608 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl757.py | grep GFLOPS >> tmp.dat
   echo mna-munv-avu 3840 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl758.py | grep GFLOPS >> tmp.dat
   echo amn-avu-munv 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl759.py | grep GFLOPS >> tmp.dat
   echo nmbpao-pmoun-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl760.py | grep GFLOPS >> tmp.dat
   echo opbman-pmoun-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl761.py | grep GFLOPS >> tmp.dat
   echo pnomba-nmpou-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl762.py | grep GFLOPS >> tmp.dat
   echo napbom-nmpou-bua 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl763.py | grep GFLOPS >> tmp.dat
   echo oanm-ovnum-uav 17496 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl764.py | grep GFLOPS >> tmp.dat
   echo noam-ovnum-uav 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl765.py | grep GFLOPS >> tmp.dat
   echo oman-mvuno-uav 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl766.py | grep GFLOPS >> tmp.dat
   echo naom-mvuno-uav 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl767.py | grep GFLOPS >> tmp.dat
   echo pnoam-umnpvo-avu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl768.py | grep GFLOPS >> tmp.dat
   echo anopm-avu-umnpvo 192 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl769.py | grep GFLOPS >> tmp.dat
   echo opnam-pomnuv-avu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl770.py | grep GFLOPS >> tmp.dat
   echo maonp-pomnuv-avu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl771.py | grep GFLOPS >> tmp.dat
   echo abmc-buca-mu 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl772.py | grep GFLOPS >> tmp.dat
   echo bcma-buca-mu 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl773.py | grep GFLOPS >> tmp.dat
   echo macb-um-buca 72 262144 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl774.py | grep GFLOPS >> tmp.dat
   echo acmb-buca-um 245760 64 64 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl775.py | grep GFLOPS >> tmp.dat
   echo bcman-buca-num 17496 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl776.py | grep GFLOPS >> tmp.dat
   echo nmcba-num-buca 648 17496 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl777.py | grep GFLOPS >> tmp.dat
   echo ancmb-buca-mnu 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl778.py | grep GFLOPS >> tmp.dat
   echo anbmc-buca-mnu 15552 648 768 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl779.py | grep GFLOPS >> tmp.dat
   echo mab-vmu-uvba 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl780.py | grep GFLOPS >> tmp.dat
   echo mab-vum-uvba 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl781.py | grep GFLOPS >> tmp.dat
   echo mab-umv-uvba 3888 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl782.py | grep GFLOPS >> tmp.dat
   echo bma-uvba-mvu 3840 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl783.py | grep GFLOPS >> tmp.dat
   echo amb-uvba-mvu 3840 4000 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl784.py | grep GFLOPS >> tmp.dat
   echo bomcan-ucba-muno 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl785.py | grep GFLOPS >> tmp.dat
   echo nacomb-muno-ucba 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl786.py | grep GFLOPS >> tmp.dat
   echo cnaomb-ucba-nmuo 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl787.py | grep GFLOPS >> tmp.dat
   echo bcnaom-ucba-nmuo 3840 4096 3456 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl788.py | grep GFLOPS >> tmp.dat
   echo mban-vnmu-bvua 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl789.py | grep GFLOPS >> tmp.dat
   echo bmna-bvua-vnmu 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl790.py | grep GFLOPS >> tmp.dat
   echo abmn-bvua-unmv 4608 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl791.py | grep GFLOPS >> tmp.dat
   echo mban-unmv-bvua 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl792.py | grep GFLOPS >> tmp.dat
   echo am-vuwa-umvw 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl793.py | grep GFLOPS >> tmp.dat
   echo ma-umvw-vuwa 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl794.py | grep GFLOPS >> tmp.dat
   echo ma-vwmu-vuwa 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl795.py | grep GFLOPS >> tmp.dat
   echo am-vuwa-vwmu 72 64 262144 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl796.py | grep GFLOPS >> tmp.dat
   echo boanm-uavb-uonvm 648 17496 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl797.py | grep GFLOPS >> tmp.dat
   echo nbmoa-uonvm-uavb 17496 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl798.py | grep GFLOPS >> tmp.dat
   echo anobm-uavb-mvuon 648 17496 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl799.py | grep GFLOPS >> tmp.dat
   echo obnma-mvuon-uavb 15552 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl800.py | grep GFLOPS >> tmp.dat
   echo nma-umwnv-uvaw 648 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl801.py | grep GFLOPS >> tmp.dat
   echo nam-umwnv-uvaw 648 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl802.py | grep GFLOPS >> tmp.dat
   echo mna-nmvwu-uvaw 576 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl803.py | grep GFLOPS >> tmp.dat
   echo nam-nmvwu-uvaw 648 768 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl804.py | grep GFLOPS >> tmp.dat
   echo bopnam-vuab-uvpmon 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl805.py | grep GFLOPS >> tmp.dat
   echo aomnbp-vuab-uvpmon 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl806.py | grep GFLOPS >> tmp.dat
   echo mobpan-ovpunm-vuab 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl807.py | grep GFLOPS >> tmp.dat
   echo npomba-ovpunm-vuab 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl808.py | grep GFLOPS >> tmp.dat
   echo maon-wnmvou-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl809.py | grep GFLOPS >> tmp.dat
   echo moan-wnmvou-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl810.py | grep GFLOPS >> tmp.dat
   echo naom-mnvuwo-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl811.py | grep GFLOPS >> tmp.dat
   echo nmoa-mnvuwo-awuv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl812.py | grep GFLOPS >> tmp.dat
   echo mbcad-mu-bduac 24 472392 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl813.py | grep GFLOPS >> tmp.dat
   echo cbadm-bduac-mu 419904 24 27 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl814.py | grep GFLOPS >> tmp.dat
   echo mcadb-um-bduac 24 472392 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl815.py | grep GFLOPS >> tmp.dat
   echo bmcad-bduac-um 472392 24 24 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl816.py | grep GFLOPS >> tmp.dat
   echo cbmdan-caubd-num 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl817.py | grep GFLOPS >> tmp.dat
   echo abncdm-caubd-num 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl818.py | grep GFLOPS >> tmp.dat
   echo mcdnba-nmu-caubd 384 65536 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl819.py | grep GFLOPS >> tmp.dat
   echo dcnbam-caubd-nmu 61440 256 200 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl820.py | grep GFLOPS >> tmp.dat
   echo mbca-muv-cvuab 768 17496 729 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl821.py | grep GFLOPS >> tmp.dat
   echo cbma-cvuab-muv 17496 768 729 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl822.py | grep GFLOPS >> tmp.dat
   echo ambc-cvuab-vmu 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl823.py | grep GFLOPS >> tmp.dat
   echo acmb-cvuab-vmu 15552 768 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl824.py | grep GFLOPS >> tmp.dat
   echo bnacm-bcvau-unmv 17496 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl825.py | grep GFLOPS >> tmp.dat
   echo cnamb-bcvau-unmv 15552 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl826.py | grep GFLOPS >> tmp.dat
   echo bnmca-bcvau-umvn 17496 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl827.py | grep GFLOPS >> tmp.dat
   echo acmbn-bcvau-umvn 15552 648 648 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl828.py | grep GFLOPS >> tmp.dat
   echo mba-vmwu-wabvu 768 648 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl829.py | grep GFLOPS >> tmp.dat
   echo bam-wabvu-vmwu 648 768 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl830.py | grep GFLOPS >> tmp.dat
   echo bam-wabvu-uvwm 648 768 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl831.py | grep GFLOPS >> tmp.dat
   echo mba-uvwm-wabvu 768 648 15552 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl832.py | grep GFLOPS >> tmp.dat
   echo bonamc-bacvu-nmuvo 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl833.py | grep GFLOPS >> tmp.dat
   echo mcnboa-nmuvo-bacvu 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl834.py | grep GFLOPS >> tmp.dat
   echo bcnaom-bacvu-ouvnm 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl835.py | grep GFLOPS >> tmp.dat
   echo ncmabo-ouvnm-bacvu 3840 4096 3600 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl836.py | grep GFLOPS >> tmp.dat
   echo mbna-unmvw-abuwv 648 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl837.py | grep GFLOPS >> tmp.dat
   echo mban-unmvw-abuwv 648 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl838.py | grep GFLOPS >> tmp.dat
   echo anmb-abuwv-wumvn 648 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl839.py | grep GFLOPS >> tmp.dat
   echo bamn-abuwv-wumvn 576 648 17496 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl840.py | grep GFLOPS >> tmp.dat
   echo omnab-umwvon-vbawu 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl841.py | grep GFLOPS >> tmp.dat
   echo oamnb-umwvon-vbawu 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl842.py | grep GFLOPS >> tmp.dat
   echo oamnb-womuvn-vbawu 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl843.py | grep GFLOPS >> tmp.dat
   echo ambno-vbawu-womuvn 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl844.py | grep GFLOPS >> tmp.dat
   echo edacbm-adebcu-um 983040 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl845.py | grep GFLOPS >> tmp.dat
   echo cmdbae-adebcu-um 983040 12 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl846.py | grep GFLOPS >> tmp.dat
   echo acbemd-adebcu-mu 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl847.py | grep GFLOPS >> tmp.dat
   echo becdma-adebcu-mu 983040 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl848.py | grep GFLOPS >> tmp.dat
   echo cdabm-cadvbu-vmu 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl849.py | grep GFLOPS >> tmp.dat
   echo macbd-vmu-cadvbu 192 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl850.py | grep GFLOPS >> tmp.dat
   echo abcdm-cadvbu-uvm 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl851.py | grep GFLOPS >> tmp.dat
   echo damcb-cadvbu-uvm 61440 200 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl852.py | grep GFLOPS >> tmp.dat
   echo dcambn-vbaduc-muvn 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl853.py | grep GFLOPS >> tmp.dat
   echo mcandb-muvn-vbaduc 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl854.py | grep GFLOPS >> tmp.dat
   echo dnabmc-vbaduc-unmv 61440 240 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl855.py | grep GFLOPS >> tmp.dat
   echo ncabdm-unmv-vbaduc 240 65536 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl856.py | grep GFLOPS >> tmp.dat
   echo mcab-umwv-avuwbc 3456 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl857.py | grep GFLOPS >> tmp.dat
   echo mbac-umwv-avuwbc 3456 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl858.py | grep GFLOPS >> tmp.dat
   echo mcba-wumv-avuwbc 3456 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl859.py | grep GFLOPS >> tmp.dat
   echo camb-avuwbc-wumv 3840 3456 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl860.py | grep GFLOPS >> tmp.dat
   echo mnbac-umvnw-abucvw 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl861.py | grep GFLOPS >> tmp.dat
   echo anmbc-abucvw-umvnw 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl862.py | grep GFLOPS >> tmp.dat
   echo bmnca-abucvw-vmwun 3840 3600 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl863.py | grep GFLOPS >> tmp.dat
   echo nacbm-vmwun-abucvw 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl864.py | grep GFLOPS >> tmp.dat
   echo cmoabn-ubavcw-vuomwn 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl865.py | grep GFLOPS >> tmp.dat
   echo anmboc-ubavcw-vuomwn 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl866.py | grep GFLOPS >> tmp.dat
   echo nboamc-vunmwo-ubavcw 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl867.py | grep GFLOPS >> tmp.dat
   echo bnaomc-ubavcw-vunmwo 3840 4096 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl868.py | grep GFLOPS >> tmp.dat
   echo nam-mun-au 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl869.py | grep GFLOPS >> tmp.dat
   echo nma-mun-au 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl870.py | grep GFLOPS >> tmp.dat
   echo man-nmu-au 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl871.py | grep GFLOPS >> tmp.dat
   echo nam-nmu-au 86400 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl872.py | grep GFLOPS >> tmp.dat
   echo mona-mnou-ua 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl873.py | grep GFLOPS >> tmp.dat
   echo onam-mnou-ua 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl874.py | grep GFLOPS >> tmp.dat
   echo noam-onum-ua 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl875.py | grep GFLOPS >> tmp.dat
   echo amno-ua-onum 72 373248 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl876.py | grep GFLOPS >> tmp.dat
   echo oanmp-noupm-au 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl877.py | grep GFLOPS >> tmp.dat
   echo npamo-noupm-au 864000 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl878.py | grep GFLOPS >> tmp.dat
   echo panmo-mpuon-au 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl879.py | grep GFLOPS >> tmp.dat
   echo poman-mpuon-au 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl880.py | grep GFLOPS >> tmp.dat
   echo omnqap-pnmuoq-au 1492992 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl881.py | grep GFLOPS >> tmp.dat
   echo npmqoa-pnmuoq-au 1492992 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl882.py | grep GFLOPS >> tmp.dat
   echo nmqpao-muopnq-au 1492992 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl883.py | grep GFLOPS >> tmp.dat
   echo mnpaoq-muopnq-au 1679616 16 18 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl884.py | grep GFLOPS >> tmp.dat
   echo bam-bua-um 86400 300 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl885.py | grep GFLOPS >> tmp.dat
   echo abm-bua-um 82944 300 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl886.py | grep GFLOPS >> tmp.dat
   echo amb-bua-mu 82944 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl887.py | grep GFLOPS >> tmp.dat
   echo bam-bua-mu 86400 288 300 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl888.py | grep GFLOPS >> tmp.dat
   echo namb-mun-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl889.py | grep GFLOPS >> tmp.dat
   echo nabm-mun-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl890.py | grep GFLOPS >> tmp.dat
   echo nmab-umn-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl891.py | grep GFLOPS >> tmp.dat
   echo manb-umn-bau 5184 5184 5000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl892.py | grep GFLOPS >> tmp.dat
   echo am-avu-muv 288 288 90000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl893.py | grep GFLOPS >> tmp.dat
   echo ma-muv-avu 288 288 90000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl894.py | grep GFLOPS >> tmp.dat
   echo ma-vmu-avu 288 288 86400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl895.py | grep GFLOPS >> tmp.dat
   echo am-avu-vmu 288 300 86400 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl896.py | grep GFLOPS >> tmp.dat
   echo ambon-uab-uomn 960 27000 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl897.py | grep GFLOPS >> tmp.dat
   echo obman-uomn-uab 28800 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl898.py | grep GFLOPS >> tmp.dat
   echo nbmao-onum-uab 30720 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl899.py | grep GFLOPS >> tmp.dat
   echo aobmn-uab-onum 960 28800 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl900.py | grep GFLOPS >> tmp.dat
   echo mna-vnmu-uva 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl901.py | grep GFLOPS >> tmp.dat
   echo man-vnmu-uva 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl902.py | grep GFLOPS >> tmp.dat
   echo anm-uva-nvum 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl903.py | grep GFLOPS >> tmp.dat
   echo nma-nvum-uva 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl904.py | grep GFLOPS >> tmp.dat
   echo anompb-uba-uonpm 288 104976 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl905.py | grep GFLOPS >> tmp.dat
   echo omnbpa-uonpm-uba 93312 324 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl906.py | grep GFLOPS >> tmp.dat
   echo abmpno-uba-numop 288 93312 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl907.py | grep GFLOPS >> tmp.dat
   echo oapbmn-numop-uba 82944 324 256 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl908.py | grep GFLOPS >> tmp.dat
   echo noam-nvuom-uav 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl909.py | grep GFLOPS >> tmp.dat
   echo onma-nvuom-uav 30720 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl910.py | grep GFLOPS >> tmp.dat
   echo noma-umovn-uav 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl911.py | grep GFLOPS >> tmp.dat
   echo noam-umovn-uav 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl912.py | grep GFLOPS >> tmp.dat
   echo amopn-vau-mvupon 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl913.py | grep GFLOPS >> tmp.dat
   echo apnom-vau-mvupon 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl914.py | grep GFLOPS >> tmp.dat
   echo anmop-vau-pnomvu 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl915.py | grep GFLOPS >> tmp.dat
   echo anmpo-vau-pnomvu 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl916.py | grep GFLOPS >> tmp.dat
   echo cmab-aucb-um 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl917.py | grep GFLOPS >> tmp.dat
   echo bcam-aucb-um 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl918.py | grep GFLOPS >> tmp.dat
   echo mbca-mu-aucb 72 373248 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl919.py | grep GFLOPS >> tmp.dat
   echo cmab-aucb-mu 373248 72 72 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl920.py | grep GFLOPS >> tmp.dat
   echo namcb-num-acub 960 28800 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl921.py | grep GFLOPS >> tmp.dat
   echo bnamc-acub-num 30720 960 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl922.py | grep GFLOPS >> tmp.dat
   echo cnabm-acub-umn 30720 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl923.py | grep GFLOPS >> tmp.dat
   echo anmbc-acub-umn 28800 900 864 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl924.py | grep GFLOPS >> tmp.dat
   echo mab-vmu-aubv 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl925.py | grep GFLOPS >> tmp.dat
   echo bma-aubv-vmu 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl926.py | grep GFLOPS >> tmp.dat
   echo amb-aubv-uvm 5184 5000 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl927.py | grep GFLOPS >> tmp.dat
   echo mba-uvm-aubv 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl928.py | grep GFLOPS >> tmp.dat
   echo mbnaoc-muon-bcau 5184 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl929.py | grep GFLOPS >> tmp.dat
   echo bmoacn-bcau-muon 5184 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl930.py | grep GFLOPS >> tmp.dat
   echo nmcoba-oumn-bcau 4608 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl931.py | grep GFLOPS >> tmp.dat
   echo cmbnao-bcau-oumn 4608 5184 4500 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl932.py | grep GFLOPS >> tmp.dat
   echo mnab-vmun-auvb 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl933.py | grep GFLOPS >> tmp.dat
   echo mnba-vmun-auvb 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl934.py | grep GFLOPS >> tmp.dat
   echo banm-auvb-mnvu 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl935.py | grep GFLOPS >> tmp.dat
   echo anmb-auvb-mnvu 5184 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl936.py | grep GFLOPS >> tmp.dat
   echo am-avwu-vuwm 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl937.py | grep GFLOPS >> tmp.dat
   echo ma-vuwm-avwu 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl938.py | grep GFLOPS >> tmp.dat
   echo am-avwu-wmvu 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl939.py | grep GFLOPS >> tmp.dat
   echo ma-wmvu-avwu 72 72 373248 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl940.py | grep GFLOPS >> tmp.dat
   echo oanmb-vnuom-abuv 28800 960 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl941.py | grep GFLOPS >> tmp.dat
   echo aonbm-abuv-vnuom 960 27000 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl942.py | grep GFLOPS >> tmp.dat
   echo obanm-omvun-abuv 28800 960 900 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl943.py | grep GFLOPS >> tmp.dat
   echo nbamo-omvun-abuv 30720 960 900 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl944.py | grep GFLOPS >> tmp.dat
   echo man-mvnuw-awvu 960 864 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl945.py | grep GFLOPS >> tmp.dat
   echo mna-mvnuw-awvu 960 864 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl946.py | grep GFLOPS >> tmp.dat
   echo amn-awvu-vnwmu 864 900 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl947.py | grep GFLOPS >> tmp.dat
   echo nam-vnwmu-awvu 960 864 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl948.py | grep GFLOPS >> tmp.dat
   echo bnpmao-vabu-omnupv 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl949.py | grep GFLOPS >> tmp.dat
   echo pbanmo-omnupv-vabu 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl950.py | grep GFLOPS >> tmp.dat
   echo mbpona-oumnpv-vabu 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl951.py | grep GFLOPS >> tmp.dat
   echo pbnaom-oumnpv-vabu 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl952.py | grep GFLOPS >> tmp.dat
   echo nmoa-mwovnu-vauw 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl953.py | grep GFLOPS >> tmp.dat
   echo omna-mwovnu-vauw 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl954.py | grep GFLOPS >> tmp.dat
   echo maon-munvow-vauw 5184 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl955.py | grep GFLOPS >> tmp.dat
   echo omna-munvow-vauw 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl956.py | grep GFLOPS >> tmp.dat
   echo mcbda-um-adbcu 24 864000 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl957.py | grep GFLOPS >> tmp.dat
   echo mbacd-um-adbcu 24 864000 32 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl958.py | grep GFLOPS >> tmp.dat
   echo dabmc-adbcu-mu 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl959.py | grep GFLOPS >> tmp.dat
   echo cmabd-adbcu-mu 921600 32 30 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl960.py | grep GFLOPS >> tmp.dat
   echo mbacnd-num-cubda 384 93312 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl961.py | grep GFLOPS >> tmp.dat
   echo nbamdc-num-cubda 288 93312 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl962.py | grep GFLOPS >> tmp.dat
   echo dbmanc-cubda-mnu 82944 288 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl963.py | grep GFLOPS >> tmp.dat
   echo mdnabc-mnu-cubda 288 93312 250 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl964.py | grep GFLOPS >> tmp.dat
   echo amcb-vucab-muv 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl965.py | grep GFLOPS >> tmp.dat
   echo cbma-vucab-muv 28800 864 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl966.py | grep GFLOPS >> tmp.dat
   echo mbac-umv-vucab 864 27000 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl967.py | grep GFLOPS >> tmp.dat
   echo acmb-vucab-umv 28800 864 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl968.py | grep GFLOPS >> tmp.dat
   echo bnacm-vcabu-unmv 28800 900 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl969.py | grep GFLOPS >> tmp.dat
   echo cnamb-vcabu-unmv 28800 900 1024 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl970.py | grep GFLOPS >> tmp.dat
   echo nmcba-nvum-vcabu 960 27000 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl971.py | grep GFLOPS >> tmp.dat
   echo bmnac-vcabu-nvum 28800 960 960 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl972.py | grep GFLOPS >> tmp.dat
   echo mba-wumv-buavw 864 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl973.py | grep GFLOPS >> tmp.dat
   echo abm-buavw-wumv 768 864 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl974.py | grep GFLOPS >> tmp.dat
   echo bam-buavw-mwuv 960 864 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl975.py | grep GFLOPS >> tmp.dat
   echo mab-mwuv-buavw 864 960 27000 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl976.py | grep GFLOPS >> tmp.dat
   echo maoncb-muovn-cvbua 5184 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl977.py | grep GFLOPS >> tmp.dat
   echo onambc-muovn-cvbua 4608 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl978.py | grep GFLOPS >> tmp.dat
   echo cbanom-cvbua-monvu 5184 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl979.py | grep GFLOPS >> tmp.dat
   echo abocnm-cvbua-monvu 4608 5184 4096 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl980.py | grep GFLOPS >> tmp.dat
   echo manb-wmvnu-buvwa 960 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl981.py | grep GFLOPS >> tmp.dat
   echo nbma-wmvnu-buvwa 960 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl982.py | grep GFLOPS >> tmp.dat
   echo mnba-wumvn-buvwa 960 960 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl983.py | grep GFLOPS >> tmp.dat
   echo abnm-buvwa-wumvn 768 900 28800 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl984.py | grep GFLOPS >> tmp.dat
   echo boman-vbawu-umvown 3840 5832 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl985.py | grep GFLOPS >> tmp.dat
   echo nobma-umvown-vbawu 5184 4096 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl986.py | grep GFLOPS >> tmp.dat
   echo manbo-uownvm-vbawu 5184 4096 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl987.py | grep GFLOPS >> tmp.dat
   echo oabnm-uownvm-vbawu 5184 4096 4608 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl988.py | grep GFLOPS >> tmp.dat
   echo emabdc-ucdbea-um 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl989.py | grep GFLOPS >> tmp.dat
   echo bcamed-ucdbea-um 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl990.py | grep GFLOPS >> tmp.dat
   echo emadcb-ucdbea-mu 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl991.py | grep GFLOPS >> tmp.dat
   echo edcbam-ucdbea-mu 1679616 16 16 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl992.py | grep GFLOPS >> tmp.dat
   echo mdbca-vmu-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl993.py | grep GFLOPS >> tmp.dat
   echo mdabc-vmu-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl994.py | grep GFLOPS >> tmp.dat
   echo mabcd-uvm-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl995.py | grep GFLOPS >> tmp.dat
   echo mcdba-uvm-bduavc 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl996.py | grep GFLOPS >> tmp.dat
   echo ndcmba-vumn-auvbcd 240 93312 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl997.py | grep GFLOPS >> tmp.dat
   echo cmbnad-auvbcd-vumn 82944 256 288 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl998.py | grep GFLOPS >> tmp.dat
   echo dabmcn-auvbcd-nmvu 82944 256 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl999.py | grep GFLOPS >> tmp.dat
   echo bncmad-auvbcd-nmvu 82944 256 324 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1000.py | grep GFLOPS >> tmp.dat
   echo macb-wumv-bcawvu 4608 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1001.py | grep GFLOPS >> tmp.dat
   echo cmab-bcawvu-wumv 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1002.py | grep GFLOPS >> tmp.dat
   echo amcb-bcawvu-wmuv 4608 4500 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1003.py | grep GFLOPS >> tmp.dat
   echo mcba-wmuv-bcawvu 4608 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1004.py | grep GFLOPS >> tmp.dat
   echo cbnam-buvawc-vunmw 4608 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1005.py | grep GFLOPS >> tmp.dat
   echo cnabm-buvawc-vunmw 4608 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1006.py | grep GFLOPS >> tmp.dat
   echo canmb-buvawc-wmunv 4608 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1007.py | grep GFLOPS >> tmp.dat
   echo mnbac-wmunv-buvawc 3840 5184 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1008.py | grep GFLOPS >> tmp.dat
   echo oncabm-uvmown-bawcvu 5184 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1009.py | grep GFLOPS >> tmp.dat
   echo ncaomb-uvmown-bawcvu 5184 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1010.py | grep GFLOPS >> tmp.dat
   echo bcamno-bawcvu-wvomun 5184 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1011.py | grep GFLOPS >> tmp.dat
   echo moncab-wvomun-bawcvu 5184 4096 5184 >> tmp.dat
   KMP_AFFINITY=compact,1 OMP_NUM_THREADS=$1 python tcl1012.py | grep GFLOPS >> tmp.dat
   cat tmp.dat | sed '$!N;s/\n/ /' > tmp2.dat
   python ../maxFromFiles.py tmp2.dat tcl.dat 4,6
done
