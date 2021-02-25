# Pandoc flat bullet list filter

Pandoc filter for transforming a bullet list into a paragraph of items separated by bullet symbols.

Sometimes long lists of short items are better formatted as a paragraph of items separated by symbols. A `div` with the class `flat-bullet-list` containing a bullet list will have its contents transformed into a paragraph containing the symbol separated list. Other attributes of the `div` are unchanged.

## Input

~~~markdown
:::{#my-id .flat-bullet-list}
  * One
  * Two
  * Three
  * Four
  * Five
  * Six
  * Seven
  * Eight
  * Nine
:::
~~~

## Output

```
One • Two • Three • Four • Five • Six • Seven • Eight • Nine
```

```latex
One \qquad \textbullet \qquad Two \qquad \textbullet \qquad Three \textbullet Four \textbullet Five \textbullet Six \textbullet Seven \textbullet Eight \textbullet Nine
```

```html
<div id="my-id" class="flat-bullet-list">
    <p>One &bull; Two &bull; Three &bull; Four &bull; Five &bull; Six &bull; Seven &bull; Eight &bull; Nine</p>
</div>
```

## Build

```
pandoc demo.md -f markdown -t latex --lua-filter pandoc-bullet-list-filter.lua -o demo.tex
pandoc demo.md -f markdown -t pdf --lua-filter pandoc-bullet-list-filter.lua -o demo.pdf
pandoc demo.md -f markdown -t html --lua-filter pandoc-bullet-list-filter.lua -o demo.html
```
