if [[ $1 -eq 0 ]]
then 
echo 1
else 
echo $((($1+1)**3 - ($1-1)**3))
fi