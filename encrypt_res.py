#!/usr/bin/env python2.7
# coding:utf-8

# 资源加密脚本


import sys
import os
import subprocess
import shutil
from copy import deepcopy


BASE_PATH = os.path.dirname(os.path.realpath(__file__)) + os.sep
res_path = BASE_PATH + "res"  # 行尾无/号
build_path = BASE_PATH + "build/res"  # 行尾无/号
# TODO: 在这里修改你的项目的加密密码，不得超过16位，记得与game_build.sh脚本中的密码一致
sign_key = "TODO_SET_PWD"  # 不得超过16位
ignore_list = [  # 一行一个，设定不要加密的资源文件名称
    "images/login.png",
]


def file_extension(path):  # 文件扩展名
    return os.path.splitext(path)[1]


def remove_file(file_path):  # 删除文件
    if os.path.isfile(file_path):
        os.remove(file_path)


def remove_path(path):  # 删除目录
    if path == "/" or path == ".":
        print("Can't do this action: remove whole ", path)
        return
    if os.path.isdir(path):
        shutil.rmtree(path)


def make_path(path):
    if os.path.isdir(path):
        return
    os.makedirs(path)


def copy_file(source, dest):  # 拷贝文件
    shutil.copy(source, dest)


def copy_path(source_path, dest_path):  # 拷贝目录
    shutil.copytree(source_path, dest_path)


def list_path_by_handler(root_dir, callback_handler):  # 带回调函数的遍历文件夹
    for lists in os.listdir(root_dir):
        path = os.path.join(root_dir, lists)
        # print path
        if os.path.isdir(path):
            list_path_by_handler(path, callback_handler)
        else:
            callback_handler(path)


def copy_no_encrypt_file_handler(file_path):
    for item in ignore_list:  # 跳过不加密的资源
        if item in file_path:
            dest_file = build_path + file_path.replace(res_path, "")
            print("copy no encrypt file: ", file_path, dest_file)
            copy_file(file_path, dest_file)
            return


remove_path(build_path)
cmd = "$QUICK_V3_ROOT/quick/bin/encrypt_res.sh -i %s -o %s -es YOUR_SIGN -ek %s" % \
      (res_path, build_path, sign_key)
subprocess.call(cmd, shell=True)
list_path_by_handler(res_path, copy_no_encrypt_file_handler)
