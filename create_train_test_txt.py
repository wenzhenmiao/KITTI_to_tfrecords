# create_train_test_txt.py
# encoding:utf-8
import pdb
import glob
import os
import random
import math

def get_sample_value(txt_name, category_name):
    label_path = './Labels/'
    txt_path = label_path + txt_name+'.txt'
    try:
        with open(txt_path) as r_tdf:
            if category_name in r_tdf.read():
                return ' 1'
            else:
                return '-1'
    except IOError as ioerr:
        print('File error:'+str(ioerr))

txt_list_path = glob.glob('./Labels/*.txt')
txt_list = []

for item in txt_list_path:
    temp1,temp2 = os.path.splitext(os.path.basename(item))
    txt_list.append(temp1)
txt_list.sort()
print(txt_list, end = '\n\n')

num_trainval = random.sample(txt_list, math.floor(len(txt_list))) 
num_trainval.sort()
print(num_trainval, end = '\n\n')

num_train = random.sample(num_trainval,math.floor(len(num_trainval)*9/10.0))
num_train.sort()
print(num_train, end = '\n\n')

num_val = list(set(num_trainval).difference(set(num_train)))
num_val.sort()
print(num_val, end = '\n\n')

#num_test = list(set(txt_list).difference(set(num_trainval)))
#num_test.sort()
#print(num_test, end = '\n\n')

pdb.set_trace()

Main_path = './ImageSets/Main/'
train_test_name = ['trainval','train','val']
#train_test_name = ['trainval','train','val','test']
category_name = ['Car','Pedestrian','Cyclist']

for item_train_test_name in train_test_name:
    list_name = 'num_'
    list_name += item_train_test_name
    train_test_txt_name = Main_path + item_train_test_name + '.txt' 
    try:
        with open(train_test_txt_name, 'w') as w_tdf:
            for item in eval(list_name):
                w_tdf.write(item+'\n')
        for item_category_name in category_name:
            category_txt_name = Main_path + item_category_name + '_' + item_train_test_name + '.txt'
            with open(category_txt_name, 'w') as w_tdf:
                for item in eval(list_name):
                    w_tdf.write(item+' '+ get_sample_value(item, item_category_name)+'\n')
    except IOError as ioerr:
        print('File error:'+str(ioerr))
