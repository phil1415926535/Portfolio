#!/bin/bash
fun_var(){

echo "#!/bin/bash" > ./script_files/stars.sh
echo "for i in {1..$1}" >> ./script_files/stars.sh
echo "do" >> ./script_files/stars.sh
echo "printf '%.s*'" >> ./script_files/stars.sh
echo "sleep $2" >> ./script_files/stars.sh
echo "done" >> ./script_files/stars.sh
}
fun_var $1 $2
sleep 0.1
./script_files/stars.sh