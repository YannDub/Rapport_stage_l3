#!/usr/bin/env bash
echo ==========================================================
echo Begining of the LaTeX compilation...
echo ==========================================================
echo Compiling PDF from book-result/Week1/rapport.tex
cd Week1
ln -s .. root
lualatex --file-line-error --interaction=nonstopmode --halt-on-error rapport.tex 2>&1 1>/dev/null
ret=$?
if [[ $ret -ne 0 ]]; then
  cat rapport.log
  echo "Can't generate the PDF!"
  exit 1
fi
rm -f *.{vrb,nav,snm,toc,out,aux,log,url}
rm -rf root
cd ..
cd ..
