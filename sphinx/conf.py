
import os

project = 'Irssi'

extensions = [
    'sphinx.ext.githubpages',
    'myst_parser',
    'sphinx_sitemap',
    'sphinx_design',
]

_html_baseurl = os.getenv('BASEURL', None)
if _html_baseurl is not None:
    html_baseurl = _html_baseurl

myst_enable_extensions = [
    'colon_fence',
    'deflist',
    'linkify',
]

myst_linkify_fuzzy_links = False

exclude_patterns = [
    '_overlay/**',
    '_*.*',
]

html_theme = "furo"

html_permalinks_icon = ""

html_static_path = ['_static']

html_css_files = [
    'theme_tweak.css'
]

html_theme_options = {
    'light_logo': 'logo_light.png',
    'dark_logo': 'logo_dark.png',
    'light_css_variables': {
        'color-brand-primary': '#405c7d',
        'color-brand-content': '#5e81ac',
        'color-header-background': '#405c7d',
        'color-header-text': '#d8dee9',
    },
    'dark_css_variables': {
        'color-brand-primary': '#8699bb',
        'color-brand-content': '#8699bb',
        'color-header-background': '#405c7d',
        'color-header-text': '#d8dee9',
    },
}
_edit_link = os.getenv('EDIT_LINK', None)
if _edit_link is not None:
    html_theme_options['source_repository_link'] = _edit_link

templates_path = ['_templates']

html_sidebars = {
    'documentation/help/**': [
        'sidebar/brand.html',
        'sidebar/search.html',
        'sidebar/scroll-start.html',
        'sidebar/navigation.html',
        'sidebar/scroll-end.html',
        'versions.html',
    ],
}

html_context = dict()
_vers = os.getenv('VERS', None)
if _vers is not None:
    html_context['help_versions'] = list(map(lambda _: _.split(':')[1],reversed(_vers.strip().split("\n"))))

html_show_copyright = False

rel_ver = os.getenv('STABLE', None)
prj = os.getenv('PRJ', project)
ver = os.getenv('VER', rel_ver)
if rel_ver is not None:
    if ver == 'dev':
        html_context['page_announcement'] = f"""<div class="admonition note">
<p class="admonition-title">Note</p>
<p>You are reading the help for the development version. <strong>The current release version is {project} {rel_ver}.</strong></p>
</div>"""
    elif ver != rel_ver:
        html_context['page_announcement'] = f"""<div class="admonition important">
<p class="admonition-title">Important</p>
<p>You are reading the help for {prj} {ver}. <strong>The current release version is {project} {rel_ver}.</strong></p>
</div>"""

if os.getenv('VER', None) is not None:
    html_title = project + ' ' + ver
else:
    html_title = project
