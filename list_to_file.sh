tail_name1=".xml"
tail_name2=".png"
tail_name3=".txt"
current_dir=$(pwd)
file_dir1="$current_dir/Annotations/"
file_dir2="$current_dir/JPEGImages/"
file_dir3="$current_dir/Labels/"

mkdir $current_dir"/KITTITRAIN"
mkdir $current_dir"/KITTITRAIN/Annotations"
mkdir $current_dir"/KITTITRAIN/ImageSets"
mkdir $current_dir"/KITTITRAIN/ImageSets/Main"
mkdir $current_dir"/KITTITRAIN/JPEGImages"
mkdir $current_dir"/KITTITRAIN/Labels"

cat ./ImageSets/Main/train.txt | while read line
do
  echo $file_dir1$line$tail_name1
  cp $file_dir1$line$tail_name1 $current_dir"/KITTITRAIN/Annotations"
  echo $file_dir1$line$tail_name2
  cp $file_dir2$line$tail_name2 $current_dir"/KITTITRAIN/JPEGImages"
  cp $file_dir3$line$tail_name3 $current_dir"/KITTITRAIN/Labels"
done

cp ./ImageSets/Main/train.txt $current_dir"/KITTITRAIN/ImageSets/Main"
cp ./ImageSets/Main/Car_train.txt $current_dir"/KITTITRAIN/ImageSets/Main"
cp ./ImageSets/Main/Cyclist_train.txt $current_dir"/KITTITRAIN/ImageSets/Main"
cp ./ImageSets/Main/Pedestrian_train.txt $current_dir"/KITTITRAIN/ImageSets/Main"

tail_name1=".xml"
tail_name2=".png"
tail_name3=".txt"
current_dir=$(pwd)
file_dir1="$current_dir/Annotations/"
file_dir2="$current_dir/JPEGImages/"
file_dir3="$current_dir/Labels/"

mkdir $current_dir"/KITTIVAL"
mkdir $current_dir"/KITTIVAL/Annotations"
mkdir $current_dir"/KITTIVAL/ImageSets"
mkdir $current_dir"/KITTIVAL/ImageSets/Main"
mkdir $current_dir"/KITTIVAL/JPEGImages"
mkdir $current_dir"/KITTIVAL/Labels"

cat ./ImageSets/Main/val.txt | while read line
do
  echo $file_dir1$line$tail_name1
  cp $file_dir1$line$tail_name1 $current_dir"/KITTIVAL/Annotations"
  echo $file_dir1$line$tail_name2
  cp $file_dir2$line$tail_name2 $current_dir"/KITTIVAL/JPEGImages"
  cp $file_dir3$line$tail_name3 $current_dir"/KITTIVAL/Labels" 
done

cp ./ImageSets/Main/val.txt $current_dir"/KITTIVAL/ImageSets/Main"
cp ./ImageSets/Main/Car_val.txt $current_dir"/KITTIVAL/ImageSets/Main"
cp ./ImageSets/Main/Cyclist_val.txt $current_dir"/KITTIVAL/ImageSets/Main"
cp ./ImageSets/Main/Pedestrian_val.txt $current_dir"/KITTIVAL/ImageSets/Main"
