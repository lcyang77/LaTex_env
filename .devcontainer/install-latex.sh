#!/bin/bash

# 更新包列表
apt-get update

# 安装TeX Live和必要工具
apt-get install -y \
    texlive-full \
    texlive-latex-extra \
    texlive-xetex \
    latexmk \
    pandoc \
    python3-pip \
    librsvg2-bin \
    pandoc-citeproc \
    libreoffice

# 安装中文字体支持
apt-get install -y fonts-noto-cjk

# 安装PDF工具
apt-get install -y poppler-utils

# 清理APT缓存
apt-get clean
rm -rf /var/lib/apt/lists/*

# 安装 LaTeX to Word 转换工具
pip3 install pandoc-latex-environment
