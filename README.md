# LaTex_env

用于在 GitHub Codespaces 中进行 LaTeX 文档编辑、编译并导出为 PDF 或 Word 的专用环境。本环境预配置了完整的 TeX Live 发行版、中文支持、PDF 工具等组件。

## 功能特点

- ✨ 完整的 TeX Live 环境
- 🀄 内置中文支持（含字体）
- 📝 VS Code LaTeX 插件支持
- 🔄 自动编译功能
- 📊 支持各类文档类型
- 📥 支持导出为 PDF 和 Word
- 🛠️ 包含环境检查工具

## 快速开始

### 1. 创建开发容器

建议先确保不会同步其他地方的Vscode中的配置，可访问<https://github.com/settings/codespaces>，到页面中取消勾选Settings Sync中的
Enable
1. 在 GitHub 上 fork 或克隆本仓库
2. 点击 "Code" -> "Create codespace on main"
3. 等待环境自动配置完成

### 2. 验证环境

打开终端
首先设置 check-latex-env.sh 的执行权限：
```bash
chmod +x check-latex-env.sh
```
运行环境检查脚本：
```bash
bash check-latex-env.sh
```

确保所有检查项目都显示 ✓ 标记。
如果出现`✗ James-Yu.latex-workshop is not installed`请先到左侧插件面板检查是否以及安装相关插件，如果已经安装则可忽视

### 3. 创建第一个文档

1. 创建新的 .tex 文件：
```tex
\documentclass{article}
\usepackage{ctex}  % 支持中文

\begin{document}
\section{Hello, World!}
你好，世界！
\end{document}
```

2. 保存文件后会自动编译生成 PDF

## 环境配置详情

### 已安装组件

- TeX Live 完整版
- XeLaTeX 引擎
- LaTeX 相关工具：
  - latexmk
  - pandoc
  - pandoc-latex-environment
- PDF 工具
- 中文字体支持

### VS Code 扩展

- LaTeX Workshop：提供编辑和编译支持
- LaTeX Utilities：增强功能支持
- LTeX：语言工具支持

## 使用指南

### 基本编译

- 保存文件时自动编译
- 手动编译快捷键：Ctrl+Alt+B
- 查看 PDF：Ctrl+Alt+V

### 中文文档

使用 ctex 包支持中文：
```tex
\documentclass{article}
\usepackage{ctex}

\begin{document}
这是中文内容
\end{document}
```

### 导出为 Word

使用 pandoc 转换：
```bash
pandoc input.tex -o output.docx
```

### 常见文档模板

1. 基础文章：
```tex
\documentclass{article}
\usepackage{ctex}
\usepackage{graphicx}
\usepackage{amsmath}

\title{文档标题}
\author{作者名}
\date{\today}

\begin{document}
\maketitle

\section{第一节}
内容...

\end{document}
```

2. 报告模板：
```tex
\documentclass{report}
\usepackage{ctex}
\usepackage{geometry}
\geometry{a4paper,margin=2.5cm}

\begin{document}
\chapter{第一章}
内容...

\end{document}
```

## 故障排除

### 常见问题

1. 编译失败
   - 检查语法错误
   - 运行 `check-latex-env.sh` 验证环境
   - 查看 `.log` 文件获取详细错误信息

2. 中文显示问题
   - 确保使用 `ctex` 包
   - 使用 XeLaTeX 编译
   - 检查字体安装

3. PDF 预览问题
   - 使用 VS Code 内置预览
   - 检查 PDF 文件是否生成

### 环境修复

如果环境出现问题，可以：

1. 重新运行安装脚本：
```bash
sudo bash .devcontainer/install-latex.sh
```

2. 重新安装 VS Code 扩展：
```bash
code --install-extension James-Yu.latex-workshop
code --install-extension tecosaur.latex-utilities
code --install-extension valentjn.vscode-ltex
```

## 贡献指南

欢迎提交 Issues 和 Pull Requests 来改进本环境。

## 许可证

[选择合适的许可证]

## 更新日志

- 2024-03-XX：初始版本发布
  - 基础环境配置
  - 添加环境检查脚本
  - 完善文档支持

## 联系方式

[添加你的联系方式]