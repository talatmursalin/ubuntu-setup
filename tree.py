#! /usr/bin/env python
# -- coding: utf-8 --
# vim:fenc=utf-8
# Copyright © 2019 mursalin mail@mail.com
# Distributed under terms of the MIT license.

import os
import sys


class bcolors:
    CYAN = '\033[96m'
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def add_files(fname, indent):
    return "\n"+indent+fname

def add_directory(dirname, indent):
    return "\n"+indent+bcolors.BOLD+bcolors.OKBLUE+dirname+bcolors.ENDC

def tailing_dir(path):
    return os.path.basename(os.path.normpath(path)) 

def n_child():
    return "├── "

def last_child():
    return "└── "

def level_indent(level,dirflag):
    ret=""
    for i in range(level):
        if dirflag[i]:
            ret+="│"+(3*" ")
        else:
            ret+=" "+(3*" ")
    return ret

def get_indent(ind,count,level,dirflag): 
    if level: 
        if ind==count-1:
            return level_indent(level,dirflag)+last_child()
        return level_indent(level,dirflag)+n_child()
    if ind==count-1:
        return last_child()
    return n_child()

def print_tree(name, path, indent,level,dirflag):
    listdir = os.listdir(path)
    listdir.sort()
    count = len(listdir)
    result= add_directory(name,indent)
    for ind,fname in enumerate(listdir):
        if os.path.isdir(os.path.join(path,fname)):
            new_indent = " "+get_indent(ind,count,level,dirflag)
            dirflag[level]=count-ind-1
            result+=print_tree(fname,os.path.join(path,fname),new_indent,level+1,dirflag)
        else:
            new_indent = " "+get_indent(ind,count,level,dirflag)
            result+=add_files(fname, new_indent)
    return result

p=[]
for i in range(1000):
    p.append(0)
tree=print_tree(tailing_dir(sys.argv[1]),sys.argv[1],"",0,p)
print(tree)







