#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 mursalin <mail@mail.com>
#
# Distributed under terms of the MIT license.

import os
import sys

class GitDir:
    def __init__(self, path):
        self.dir = path
        self.untracked = self.get_untracked()
        self.modified = self.get_modified()

    def get_untracked(self):
        cmd = "cd "+self.dir+" && git ls-files --others --exclude-standard"
        output = os.popen(cmd).read().split('\n')
        output.remove('')
        output[:] = [os.path.join(self.dir,x) for x in output]
        return output

    def get_modified(self):
        cmd = "cd "+self.dir+" && git status -s | grep '^ M'"
        output = os.popen(cmd).read().split(' M ')
        output.remove('')
        output[:] = [os.path.join(self.dir,x.replace('\n','')) for x in output]
        return output

