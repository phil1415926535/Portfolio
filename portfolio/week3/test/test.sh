read -p "enter number 1:  " var1
read -p "enter number 2:  " var2
read -p "enter number 3:  " var3
    
    for dl in $var1 $var2 $var3
    do
        if [[ -z $var1 || -z $var2 || -z $var3 ]];
        then
            echo "Enter 3 numbers please: Goodbye"
            exit
        else
            for abc in $dl
            do
            mkdir "./week$abc"
            done

        fi     
    done
