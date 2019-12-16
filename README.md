# KITTI_to_tfrecords
## Convert KITTI datasets to tfrecords format.


# 1. 准备kitti数据集
## 在data/文件夹下新建KITTIdevkit/KITTI两层子目录，所需文件放在KITTI/中
```python
Annotations/
└── 000000.xml 
ImageSets/
└── main/
      └── trainval.txt
      └── test.txt # 等等
JPEGImages/
└── 000000.png
Labels/
└── 000000.txt # 自建文件夹，存放原始标注信息，待转化为xml，不属于VOC格式
create_train_test_txt.py # 3个python工具，后面有详细介绍
modify_annotations_txt.py
txt_to_xml.py
```

# 2. 创建docker容器，挂载目录至/home/yourname/data/
```python
nvidia-docker run -it -v /data/miaowenzhen/datasets/KITTIdevkit:/home/mx/data/KITTIdevkit horovod/pocketflow
```

# 3. 修改KITTI标注，
```python
python modify_annotations_txt.py
```

# 4. 将标注文件从txt转化为xml
```python
python txt_to_xml.py
```

# 5. 为xml文件添加截断、困难标签
```python
bash add_label.sh Annotations/
```

# 6. 生成列表文件
```python
python3 create_train_test_txt.py 
```

# 7. 分割TRAIN，VAL子集
```python
bash list_to_file.sh
```

# 8. 转换为tfrecord格式
```python
python ./dataset/convert_tfrecords.py
```
