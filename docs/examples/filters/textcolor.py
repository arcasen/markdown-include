#!/usr/bin/env python3
from panflute import *

def action(elem, doc):
    # 只处理 Span 元素且包含 color 属性
    if isinstance(elem, Span) and 'color' in elem.attributes:
        color = elem.attributes['color']
        
        # HTML 输出
        if doc.format == 'html':
            elem.attributes['style'] = f"color: {color};"
            return elem
        
        # LaTeX 输出
        elif doc.format == 'latex':
            content = stringify(elem)
            # HEX 颜色处理（如 #FF0000 → [HTML]{FF0000}）
            if color.startswith('#'):
                return RawInline(
                    f"\\textcolor[HTML]{{{color[1:]}}}{{{content}}}",
                    format='latex'
                )
            else:
                return RawInline(
                    f"\\textcolor{{{color}}}{{{content}}}",
                    format='latex'
                )
        
        # 其他格式保持原样
        return elem

def main(doc=None):
    return run_filter(action, doc=doc)

if __name__ == "__main__":
    main()