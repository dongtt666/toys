#!/usr/bin/env python
#!encoding:utf-8
#!filename:test_filedialog.py
import tkinter.filedialog as filedialog
from tkinter import *
import os
from tkinter import *
 
def callback():
    entry.delete(0,END) #清空entry里面的内容
    listbox_filename.delete(0,END)
    #调用filedialog模块的askdirectory()函数去打开文件夹
    global filepath
    filepath = filedialog.askdirectory() 
    if filepath:
        entry.insert(0,filepath) #将选择好的路径加入到entry里面
    print (filepath)
    getdir(filepath)
 
def getdir(filepath=os.getcwd()):
    """
    用于获取目录下的文件列表
    """
    cf = os.listdir(filepath)
    for i in cf:
        listbox_filename.insert(END,i)
 
if __name__ == "__main__":
    root = Tk()
    root.title("测试版本")
    root.geometry("400x400")
    root.rowconfigure(1, weight=1)
    root.rowconfigure(2, weight=8)
 
    entry = Entry(root, width=60)
    entry.grid(sticky=W+N, row=0, column=0, columnspan=4, padx=5, pady=5)
 
    button = Button(root,text="选择文件夹",command=callback)
    button.grid(sticky=W+N, row=1, column=0, padx=5, pady=5)
    #创建loistbox用来显示所有文件名
    listbox_filename = Listbox(root, width=60)
    listbox_filename.grid(row=2, column=0, columnspan=4, rowspan=4, 
                            padx=5, pady=5, sticky=W+E+S+N)
 
    root.mainloop()
