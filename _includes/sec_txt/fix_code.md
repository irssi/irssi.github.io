{%
if include.md %}{%
    assign codesplit = include.text | prepend: "#<" | append: ">#" | split: "`" %}{%
    capture temp %}{%
        for part in codesplit
	    %}`{{part | replace_first: "'", "`" }}{%
	endfor %}{%
    endcapture
    %}{{temp|remove_first: "`#<"|split:""|reverse|join:""|remove_first: "#>"|split:""|reverse|join:""}}{%
else
    %}{{include.text}}{%
endif -%}