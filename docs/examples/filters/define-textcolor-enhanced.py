#!/usr/bin/env python3

from panflute import *

def prepare(doc):
    pass

def action(elem, doc):
    # 处理行内颜色 [文字]{color=颜色}
    if isinstance(elem, Span) and 'color' in elem.attributes:
        color = elem.attributes['color']
        
        if doc.format in ('html', 'html5'):
            # HTML 输出
            elem.attributes['style'] = f'color: {color};'
            
        elif doc.format == 'latex':
            # LaTeX/PDF 输出
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
        
        elif doc.format == 'docx':
            # DOCX 输出 - 使用 OpenXML 属性
            elem.attributes['custom-style'] = 'ColoredText'
            # 将颜色信息存储在临时属性中，后续处理
            elem.attributes['_color'] = color
        
        del elem.attributes['color']
        return elem
    
    # 处理块级颜色 ::: {color=颜色} 文字内容 :::
    elif isinstance(elem, Div) and 'color' in elem.attributes:
        color = elem.attributes['color']
        
        if doc.format in ('html', 'html5'):
            elem.attributes['style'] = f'color: {color};'
            
        elif doc.format == 'latex':
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
        
        elif doc.format == 'docx':
            # DOCX 输出 - 使用 Div 的 custom-style
            elem.attributes['custom-style'] = 'ColoredBlock'
            # 存储颜色信息
            elem.attributes['_color'] = color
        
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
    
    # 为 DOCX 准备参考文档
    elif doc.format == 'docx':
        # 添加自定义样式的参考文档
        if 'reference-doc' not in doc.metadata:
            doc.metadata['reference-doc'] = MetaInlines(Str('custom-reference.docx'))


if __name__ == '__main__':
    run_filter(action, prepare=prepare, finalize=finalize, doc=None)