<!-- {{ include.ver }} -->{%
assign ver = include.ver | prepend: 'v' %}
<p class="download-links raggedright"
>{%
assign first = true %}{%
for rg in site.data.relnews_artef[ver].artef_rg
    %}{% unless first %} &nbsp; {% else %}{% assign first = false %}{% endunless
    %}<span class="download-group"
      ><a href="{{rg.a.url}}"
       ><span class="glyphicon glyphicon-download-alt"></span>&nbsp;{% comment %}{%
       endcomment
       %}{{rg.a.name}}</a>{%
       if rg.sig
           %} &nbsp; <a href="{{rg.sig.url}}"
	     ><span class="signature-icon">&nbsp;</span>&nbsp;{% comment %}{%
	     endcomment
	     %}{{rg.sig.name}}</a>{% comment %}{%
	     endcomment
	     %}{%
       endif
    %}</span>{%
endfor %}{%
for a in site.data.relnews_artef[ver].artef_extra
    %} &nbsp; <a href="{{a.url}}"
       ><span class="glyphicon glyphicon-download-alt"></span>&nbsp;{% comment %}{%
       endcomment
       %}{{a.name}}</a>{%
endfor
%}</p>{% comment %}{%
endcomment -%}
