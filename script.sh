#!/bin/sh
arg1=$1
ts=$(date +%s)
rs="output/result_$ts.out"
case $arg1 in
    build)
        docker-compose build
        ;;
    run)
        docker-compose up > $rs && docker-compose rm -fsv
        echo "See result: $rs"
        ;;
    clean)
        rm -f output/result_*.out
        ;;
    *)
        echo "Wrong command"
        echo "Usage: ./script.sh command"
        echo "\tbuild:\t Create or recreate the environment upon any modifications."
        echo "\trun:\t Run your test in write-test-here and check the result in output"
        ;;
esac