#! /bin/bash
function read_dir(){
 for file in `ls $1`
 do
  if [ -d $1"/"$file ] 
  then
  read_dir $1"/"$file
  else
  echo $1"/"$file #act here
  sed -i '/\/bndbox>/a \<difficult>0</difficult>' $PWD/$1/$file
  sed -i '/difficult/a \<truncated>0</truncated>' $PWD/$1/$file
  fi
 done
}
#read first para
read_dir $1
