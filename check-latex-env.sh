#!/bin/bash

echo "=== LaTeX Environment Configuration Check ==="
echo

echo "1. Checking TeX Live Installation:"
echo "--------------------------------"
if command -v tex >/dev/null 2>&1; then
    tex --version | head -n 1
    echo "✓ TeX is installed"
else
    echo "✗ TeX is not installed"
fi

if command -v xelatex >/dev/null 2>&1; then
    xelatex --version | head -n 1
    echo "✓ XeLaTeX is installed"
else
    echo "✗ XeLaTeX is not installed"
fi

echo -e "\n2. Checking Chinese Font Support:"
echo "--------------------------------"
if fc-list :lang=zh | grep -q .; then
    echo "✓ Chinese fonts are installed"
    echo "Installed Chinese fonts count: $(fc-list :lang=zh | wc -l)"
else
    echo "✗ No Chinese fonts found"
fi

echo -e "\n3. Checking Required Tools:"
echo "--------------------------------"
tools=("latexmk" "pandoc" "python3" "pip3" "libreoffice" "pdfinfo")
for tool in "${tools[@]}"; do
    if command -v $tool >/dev/null 2>&1; then
        echo "✓ $tool is installed"
        $tool --version 2>/dev/null | head -n 1
    else
        echo "✗ $tool is not installed"
    fi
done

echo -e "\n4. Checking Python Packages:"
echo "--------------------------------"
if pip3 list | grep -q "pandoc-latex-environment"; then
    echo "✓ pandoc-latex-environment is installed"
else
    echo "✗ pandoc-latex-environment is not installed"
fi

echo -e "\n5. Checking VS Code Extensions:"
echo "--------------------------------"
if command -v code >/dev/null 2>&1; then
    for ext in "James-Yu.latex-workshop" "tecosaur.latex-utilities" "valentjn.vscode-ltex"; do
        if code --list-extensions | grep -q "$ext"; then
            echo "✓ $ext is installed"
        else
            echo "✗ $ext is not installed"
        fi
    done
else
    echo "Note: VS Code CLI not available - cannot check extensions"
fi

echo -e "\n6. Checking Configuration Files:"
echo "--------------------------------"
files=(".devcontainer/devcontainer.json" ".devcontainer/install-latex.sh" ".vscode/settings.json")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file exists"
    else
        echo "✗ $file not found"
    fi
done

echo -e "\n7. Testing LaTeX Compilation:"
echo "--------------------------------"
# Create test file
cat > test.tex << 'EOL'
\documentclass{article}
\usepackage{ctex}
\begin{document}
Hello World! 你好，世界！
\end{document}
EOL

# Try to compile
if xelatex -interaction=nonstopmode test.tex >/dev/null 2>&1; then
    echo "✓ LaTeX compilation successful"
    if [ -f "test.pdf" ]; then
        echo "✓ PDF generated successfully"
    else
        echo "✗ PDF generation failed"
    fi
else
    echo "✗ LaTeX compilation failed"
fi

# Cleanup
rm -f test.* >/dev/null 2>&1

echo -e "\nCheck completed!"