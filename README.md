# KITTI_to_tfrecords
## Convert KITTI datasets to tfrecords format.


# 1. Prepare KITTI datasets
## Establish two level sub-folder under data/, needed files place under KITTI/
```python
Annotations/
└── 000000.xml 
ImageSets/
└── main/
      └── trainval.txt
      └── test.txt # etc
JPEGImages/
└── 000000.png
Labels/
└── 000000.txt # Self-create folder, which stored original label-info, wait to convert to xml
create_train_test_txt.py # 3 python utils descripted in following
modify_annotations_txt.py
txt_to_xml.py
```

# 2. Create docker container, mount dataset to /home/yourname/data/ 
```python
nvidia-docker run -it -v /data/miaowenzhen/datasets/KITTIdevkit:/home/mx/data/KITTIdevkit horovod/pocketflow
```

# 3. Modify KITTI labels
```python
python modify_annotations_txt.py
```

# 4. Convert label-files from txt to xml
```python
python txt_to_xml.py
```

# 5. Add truncate and difficult label to xml files
```python
bash add_label.sh Annotations/
```

# 6. Create list file
```python
python3 create_train_test_txt.py 
```

# 7. Divide datasets to train and validation subsets
```python
bash list_to_file.sh
```

# 8. Convert to tfrecord format
```python
python ./dataset/convert_tfrecords.py
```
