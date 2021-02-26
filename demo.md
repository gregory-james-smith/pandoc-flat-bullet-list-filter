---
title: Test document for Pandoc generation
subtitle: Demonstration of Pandoc flat bullet list filter
author: Isaac Newton
date: 1 January 2021
lang: en-GB
---

# Native `div` environment

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

# HTML `div` environment

<div class="flat-bullet-list">
  * One
  * Two
  * Three
  * Four
  * Five
  * Six
  * Seven
  * Eight
  * Nine
</div>
