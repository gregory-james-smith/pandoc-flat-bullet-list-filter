# Pandoc flat bullet list filter

Pandoc filter for making bullet list into paragraph of items separated by bullet symbols

## Build

```
pandoc demo.md -f markdown -t latex --lua-filter pandoc-bullet-list-filter.lua -o demo.tex
pandoc demo.md -f markdown -t pdf --lua-filter pandoc-bullet-list-filter.lua -o demo.pdf
pandoc demo.md -f markdown -t html --lua-filter pandoc-bullet-list-filter.lua -o demo.html
```
