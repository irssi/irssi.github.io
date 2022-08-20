import sys

import os
from os import path

import re

import docutils

from sphinx.search import js_index
from sphinx.search import IndexBuilder

import myst_parser
from myst_parser.mdit_to_docutils.base import DocutilsRenderer
from myst_parser.parsers.mdit import create_md_parser
from myst_parser.config.main import read_topmatter
from myst_parser.config.main import MdParserConfig

sys.dont_write_bytecode = True
sys.path.append(path.join(path.dirname(__file__), '..', 'sphinx'))
import conf as sphinx_conf

class XEnv:
    def __init__(self, envversion):
        self.version = envversion
        self.domains = {}

class XConf:
    pass

class ManualIndex:
    indexer_format = js_index

    def __init__(self, fn: str, *sources):
        searchindexfn = fn

        with open(searchindexfn, encoding='utf-8') as fti:
            idx = self.indexer_format.load(fti)

        self.mconfig = MdParserConfig()
        for i in dir(sphinx_conf):
            if i.startswith('myst_'):
                setattr(self.mconfig, i.removeprefix('myst_'), getattr(sphinx_conf, i))
        self.mconfig.title_to_header = True

        lang = 'en'
        self.config = XConf()
        self.config.html_search_options = {}
        self.config.html_search_scorer = None
        self.indexer = IndexBuilder(XEnv(idx.get('envversion')), lang,
                                    self.config.html_search_options,
                                    self.config.html_search_scorer)

        with open(searchindexfn, encoding='utf-8') as ft:
            self.indexer.load(ft, self.indexer_format)

        for source in sources:
            bn = path.basename(source)
            source = path.relpath(source)
            for sfx in ['.markdown', '.md', '.txt', '.html']:
                if bn.endswith(sfx):
                    bn = bn.removesuffix(sfx)
                    break
            dated = re.split(r'^(\d{4})-(\d{2})-(\d{2})-', bn, maxsplit=1)
            bn = dated[-1]
            if len(dated) > 1:
                pagename = '/'.join(dated[1:])
            else:
                pagename = '/'.join([*source.split('/')[1:-1], bn])
                pagename = pagename.replace('_security_html', 'security/html')
            title = bn.replace('-', ' ').replace('_', '-').title()
            with open(source, encoding='utf-8') as sourcef:
                text = sourcef.read()
                meta = read_topmatter(text)
                if 'title' in meta:
                    title = meta['title']
                elif 'name' in meta:
                    title = meta['name']
                doctree = docutils.utils.new_document(source)
                parser = create_md_parser(self.mconfig, DocutilsRenderer)
                parser.options["document"] = doctree
                parser.render(text)
            print({'source': source, 'title': title})
            self.indexer.feed(pagename, source, title, doctree)
        # first write to a temporary file, so that if dumping fails,
        # the existing index won't be overwritten
        with open(searchindexfn + '.tmp', 'w', encoding='utf-8') as ft:
            self.indexer.dump(ft, self.indexer_format)
        os.replace(searchindexfn + '.tmp', searchindexfn)

if __name__ == "__main__":
    ManualIndex(*sys.argv[1:])
