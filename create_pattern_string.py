#!/usr/bin/env python3

#  coding=utf-8
#  Copyright 2022 Institute of Formal and Applied Linguistics. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import random 
import numpy as np
import shutil

def create_samples(sample_size,l_lim,u_lim):
    samples=set()
    for s_id in range(sample_size*4):
        n = random.randint(l_lim,u_lim)
        arr = [str(random.randrange(2)) for _ in range(n)]
        string = " ".join(arr)
        try:
            samples.add(string)
            if len(samples)==sample_size:
                break
        except:
            continue
    val  = set(random.sample(samples, 1000))
    train = samples - val
    return train,val

def create_experiment_folder(dirPath):
    if not os.path.isdir(dirPath):
        os.mkdir(dirPath)
    else:
        shutil.rmtree(dirPath)
        os.mkdir(dirPath)
    return None
    
def create_experiment_data():
    data_rep = os.path.join(os.getcwd(),"s_task_data")
    exp_bins = [10,20,30,40,50,60]
    for l_ in range(1,len(exp_bins)):
        current = "len_"+str(exp_bins[l_-1])+"_"+str(exp_bins[l_])
        cur_loc = os.path.join(os.getcwd(),current)
        create_experiment_folder(cur_loc)
        src_train = os.path.join(data_rep,current+".train")
        # tgt_train = os.path.join(os.getcwd(),os.path.join(current,"train.trg"))
        tgt_train = os.path.join(os.getcwd(),os.path.join(current,"train"))
        shutil.copyfile(src_train,tgt_train)
        for f_iles in os.listdir(data_rep):
            if ".val" in f_iles:
                # if not f_iles.replace(".val","") == current:
                src_loc = os.path.join(data_rep,f_iles)
                # val_tgt_name = (f_iles).replace(".val","")+".trg"
                val_tgt_name = (f_iles).replace(".val","")
                val_loc      =  os.path.join(cur_loc,val_tgt_name)
                shutil.copyfile(src_loc,val_loc)


def main(dirPath):
    length_brackets=[10,20,30,40,50,60]
    sample_size=31000
    for l_ in range(1,len(length_brackets)):
        f_name_train   = "len_"+str(length_brackets[l_-1])+"_"+str(length_brackets[l_])+".train"
        f_name_val    = "len_"+str(length_brackets[l_-1])+"_"+str(length_brackets[l_])+".val"
        filePath_train = os.path.join(dirPath,f_name_train)
        filePath_val  = os.path.join(dirPath,f_name_val)        
        f_ile_train    = open(filePath_train,"w")
        f_ile_val     = open(filePath_val,"w")
        train,val  = create_samples(sample_size,length_brackets[l_-1]+1,length_brackets[l_])
        for sample_train in train:
            print(sample_train, file=f_ile_train)
        for sample_val in val:
            print(sample_val,  file=f_ile_val)            
        f_ile_train.close()
        f_ile_val.close()

    create_experiment_data()


if __name__=="__main__":
    dirPath = os.path.join(os.getcwd(),"s_task_data")
    create_experiment_folder(dirPath)
    main(dirPath)
    