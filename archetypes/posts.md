{{- $max := 0 -}}
{{- range where site.RegularPages "Type" "posts" -}}
{{- if findRE "^[0-9]+$" .File.ContentBaseName 1 -}}
{{- $n := int .File.ContentBaseName -}}
{{- if gt $n $max -}}{{- $max = $n -}}{{- end -}}
{{- end -}}
{{- end -}}
{{- $next := add $max 1 -}}
---
title: "{{ $next }}"
date: {{ .Date }}
# Must match an entry in your site's data/categories.yaml.
# Examples from this theme's demo site (exampleSite/data/categories.yaml):
#   info, libre, logique, normal, perso
categories: ["normal"]
# Free-form keywords, as many as you like. Examples already used in the demo site:
#   advice, bleak, common sense, community living, dad, delirium, irony,
#   learning, moral, personal, privacy, proverb, romantic relationship,
#   sexism, social
tags: []
draft: true
---
