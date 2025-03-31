---
layout: default
title: Auto-Index
---

# All Documents

{% raw %}
<ul>
  {% assign all_md = site.pages | where_exp: "item", "item.path contains '.md'" | sort: "name" %}
  {% for page in all_md %}
    {% unless page.name == "index.md" %}
      <li>
        <a href="{{ page.url | replace: '.md', '' }}">{{ page.title | default: page.name }}</a>
        <small>(Last modified: {{ page.modified_time | date: "%b %d, %Y" }})</small>
      </li>
    {% endunless %}
  {% endfor %}
</ul>
{% endraw %}
