for dir in $1*/
do
  dir=${dir%*/}
  printf "\n"$dir"\n"
  ./analyzeResult.py $dir
done
cd ..
