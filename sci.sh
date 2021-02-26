#!/usr/bin/env bash
# wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"  -l1 --no-parent $(curl https://sci-hub.se/"$@" | grep -ohP 'https\:\/.*?\.pdf')
# echo $(curl https://sci-hub.se/"$@" | grep -ohP 'https\:\/.*?\.pdf')
sci="https://sci-hub.se/"
doi=(
10.1093/ajh/hpz193
10.1111/eci.12718
10.1159/000502328
10.1186/s12882-020-1710-6
10.5830/CVJA-2018-068
10.1186/s12882-019-1374-2
10.1159/000501392
10.1111/nep.12212
10.1210/jc.2015-3056
10.1080/0886022X.2018.1455588
10.1016/j.jacl.2018.02.009
10.1159/000501687
10.1016/j.tcm.2012.09.003
10.1007/s00198-020-05423-y
10.1159/000494441
10.1186/s12933-017-0509-7
10.1093/ndt/gfp137
10.1007/s00259-015-3203-6
10.1016/j.amjcard.2017.01.022
10.1016/j.jjcc.2017.05.001
10.2214/AJR.15.14794
10.1186/s12882-018-0910-9
10.1007/s11255-017-1604-0
10.2174/157016108783955374
10.3109/0886022X.2015.1077316
10.1016/j.acra.2015.08.017
10.1053/j.jrn.2004.09.027
10.1186/s12882-017-0705-4
10.2215/CJN.00260109
10.1038/ki.2010.70
10.5527/wjn.v5.i5.437
10.1186/s13023-016-0421-3
10.1620/tjem.226.137
10.1007/s11255-017-1515-0
10.1159/000368476
10.1159/000380823
10.1016/j.amjcard.2017.07.020
10.2174/15701611113119990146
10.1007/s00125-002-0920-8
10.5527/wjn.v4.i5.500
10.1093/ndt/gfr089
10.1007/s11255-016-1231-1
10.1053/j.ajkd.2011.04.018
10.1159/000334597
10.1093/ndt/gfm566
10.1111/nep.12210
10.1007/s11255-011-0076-x
10.1016/j.bone.2011.01.016
10.1111/tri.12151
10.1038/ki.2015.194
10.1007/s00223-014-9891-2
10.1186/1471-2369-15-190
10.1007/s00223-012-9655-9
10.1093/ndt/gfn571
10.15386/cjmed-515
10.1159/000443845
10.1007/s11255-017-1758-9
10.5414/cnp73360
10.1159/000095362
10.2215/CJN.03980609
10.1371/journal.pone.0039241
10.1159/000362862
10.1093/ndt/gfp061
10.2215/CJN.03910411
10.1007/s11255-013-0620-y
10.4103/0971-3026.85371
10.1016/j.amjcard.2008.04.007
10.2215/CJN.02190507
10.1111/j.1542-4758.2011.00571.x
10.1007/s00223-012-9595-4
10.1016/j.transproceed.2005.11.041
10.1159/000157629
10.1093/ndt/gft039
10.2215/CJN.01760506
10.1159/000360230
10.1016/j.bone.2016.08.007
10.2215/CJN.02560310
10.1007/s00774-016-0788-1
10.1371/journal.pone.0114358
10.1186/1471-2369-14-221
10.1093/ndt/gfp253
10.1016/j.amjcard.2005.05.042
10.5414/CN108716
10.5551/jat.5595
10.5414/cnp74091
10.1016/j.bone.2014.03.048
10.1159/000099095
10.1093/ndt/13.8.2037
10.1111/j.1523-1755.2004.00972.x
10.1111/j.1523-1755.2005.00345.x
10.1016/j.amjcard.2012.07.044
10.1111/j.1542-4758.2010.00480.x
10.1016/j.transproceed.2011.11.031
10.1038/ki.2008.458
10.1093/ndt/gfp301
10.1111/j.1523-1755.2005.00233.x
10.5301/jva.5000591
10.1093/ndt/gfl118
10.1016/j.atherosclerosis.2007.03.047
10.2215/CJN.11211210
10.1111/j.1525-1594.2009.00814.x
10.1159/000321642
10.1016/j.atherosclerosis.2011.11.028
10.1093/ndt/gfh414
10.1111/j.1365-2362.2008.02032.x
10.1186/s12882-015-0139-9
10.1111/j.1542-4758.2012.00739.x
10.1159/000046119
10.1016/j.amjcard.2008.08.032
)

for f in ${doi[@]};
do
  DOI=$(curl ${sci}${f} | grep -ohP 'https\:\/.*?\.pdf' | head -1)
  if [ ! "$(curl ${sci}${f} | grep -hP 'http.*?pdf')" ]; then echo 'https://'$(curl ${sci}${f} | grep -ohP 'sci.*?pdf' | head -1) >> scipdf.txt; fi
  echo $DOI >> scipdf.txt
#    if [ "$DOI" ]; then
#      wget  --user-agent="Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"  -l1 --no-parent $DOI 2>/dev/null
#    else
#      echo "No pdf for $f"
#    fi
done
wget -i scipdf.txt
