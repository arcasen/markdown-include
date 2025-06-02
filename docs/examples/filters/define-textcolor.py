#!/usr/bin/env python3

from panflute import *

def prepare(doc):
    pass

def action(elem, doc):
    # 处理行内颜色 [文字]{color=颜色}
    if isinstance(elem, Span) and 'color' in elem.attributes:
        color = elem.attributes['color']
        
        if doc.format in ('html', 'html5'):
            # HTML 输出 - 直接使用颜色值
            elem.attributes['style'] = f'color: {color};'
            
        elif doc.format == 'latex':
            # LaTeX 输出 - 处理不同颜色格式
            if color.startswith('#'):
                # 十六进制颜色
                elem.content = [RawInline(f'\\textcolor[HTML]{{{color[1:]}}}{{', format='latex')] + \
                              list(elem.content) + \
                              [RawInline('}', format='latex')]
            else:
                # 标准颜色名称
                elem.content = [RawInline(f'\\textcolor{{{color}}}{{', format='latex')] + \
                              list(elem.content) + \
                              [RawInline('}', format='latex')]
        
        del elem.attributes['color']
        return elem
    
    # 处理块级颜色 ::: {color=颜色} 文字内容 :::
    elif isinstance(elem, Div) and 'color' in elem.attributes:
        color = elem.attributes['color']
        
        if doc.format in ('html', 'html5'):
            # HTML 输出
            elem.attributes['style'] = f'color: {color};'
            
        elif doc.format == 'latex':
            # LaTeX 输出
            if color.startswith('#'):
                # 十六进制颜色
                elem.content = [RawBlock(f'{{\\color[HTML]{{{color[1:]}}}', format='latex')] + \
                              list(elem.content) + \
                              [RawBlock('}', format='latex')]
            else:
                # 标准颜色名称
                elem.content = [RawBlock(f'{{\\color{{{color}}}', format='latex')] + \
                              list(elem.content) + \
                              [RawBlock('}', format='latex')]
        
        del elem.attributes['color']
        return elem

def finalize(doc):
    # 添加 LaTeX 前置内容
    if doc.format == 'latex':
        if 'header-includes' not in doc.metadata:
            doc.metadata['header-includes'] = MetaList()
        
        header = RawBlock(r"""
\usepackage{xcolor}
""", format='latex')
        doc.metadata['header-includes'].append(header)


if __name__ == '__main__':
    run_filter(action, prepare=prepare, finalize=finalize, doc=None)