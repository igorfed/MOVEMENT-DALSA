#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
NOW_H=$(date +"%H")
for ((H=NOW_H;H<=16;H++));
do
	 #if [ $H -eq $NOW_H ]; then
	#	h=$H
	
	#echo "./bin/capture_tohour -f5 -H${H} -M55 -B1000000 -o Video/S1124070"
	./bin/capture_tohour -f5 -H${H} -M55 -B1000000 -o Video/S1124070
	
	# fi

done
    #for P in {0..11}
    #do
	#M=$(($((5*$P))))
	#echo "./bin/capture_tohour -f5 -H${H} -M${M} -B1000000 -o Video/"
	#./bin/capture_tohour -f5 -H${H} -M${M} -B1000000 -o Video/
    #done
#echo "---------------"
#done

