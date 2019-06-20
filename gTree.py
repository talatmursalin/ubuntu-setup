#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 mursalin <mail@mail.com>
#
# Distributed under terms of the MIT license.

import os
import sys
import gitDir

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



class MyPath:
    def __init__(self,path,gitinfo,last_child=False,root=True,indent=""):
        self.path = path
        self.root=root
        self.gitinfo=gitinfo
        self.is_dir = os.path.isdir(path)
        self.is_last_child = last_child
        self.name = self.get_colored_name()
        self.generate_tree(indent)

    def get_colored_name(self):
        name=self.path.split("/")[-1]
        if self.path in self.gitinfo.untracked:
            return bcolors.FAIL+name+bcolors.ENDC
        if self.path in self.gitinfo.modified:
            return bcolors.OKBLUE+name+bcolors.ENDC
        return name

    def generate_tree(self,indent):
        self.tree="\n"+indent+self.get_prefix()+self.name
        if self.is_dir:
            temp = os.listdir(self.path)
            for i,p in enumerate(temp):
                if p==".git":
                    continue
                self.tree+=MyPath(os.path.join(self.path,p),self.gitinfo,last_child=i+1==len(temp),root=False,indent=indent+self.get_indent()).tree

    def get_indent(self):
        if self.root:
            return ""
        if self.is_last_child:
            return "   "
        return "│   "

    def get_prefix(self):
        if self.root:
            return ""
        if self.is_last_child:
            return "└── "
        return "├── "
        

p = MyPath(sys.argv[1], gitDir.GitDir(sys.argv[1]))
print(p.tree)
