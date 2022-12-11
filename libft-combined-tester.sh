#!/bin/bash

COLOR_STOP="\033[0m"
UNDERLINE="\033[4m"
RED="\033[31m"
CYAN="\033[36m"
GREEN="\033[32m"

mkdir -p results

printf "${RED}Running War Machine${COLOR_STOP}"
echo
sh ./libft-war-machine/grademe.sh | pv -s 8571 -w 80 > ./results/war-machine-results.txt 
printf "${GREEN}Test done!${COLOR_STOP}"
echo "Cleaning..."
(cd .. && make fclean > /dev/null)

printf "${RED}Running libf-unit-test:${COLOR_STOP}"
echo
(cd ./libft-unit-test && make f) | pv -s 13457 -w 80 > ./results/unit-test-results.txt
cp ./libft-unit-test/result.log ./results/unit-test-results.txt
printf "${GREEN}Test done!${COLOR_STOP}"
echo "Cleaning..."
rm ../libft.so
(cd .. && make fclean > /dev/null)

printf "${UNDERLINE}${RED}Running Tripouille:${COLOR_STOP}"
echo
(cd ./libftTester/ && make a) | pv -s 8273 -w 80 > ./results/tripouille-results.txt
echo "Test done!"
echo "Cleaning..."
(cd .. && make fclean > /dev/null)
printf "${CYAN}Tests complete. You can find the results in the results sub-directory.${COLOR_STOP}"
echo
