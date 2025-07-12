#!/usr/bin/env python3

import panflute as pf

def action(elem, doc):
    # 处理 Link 元素
    if isinstance(elem, pf.Link) and elem.url.startswith('#'):
        labelid = elem.url[1:]  # 移除 '#' 获取 labelid
        if not elem.content:  # 空链接，如 [](#labelid)
            if doc.format == 'latex':
                # 转换为 LaTeX 的 \ref{labelid}
                return pf.RawInline(f'\\ref{{{labelid}}}', format='latex')
            elif doc.format == 'html':
                # 转换为 HTML 的 <a href="#labelid">labelid</a>
                return pf.RawInline(f'<a href="#{labelid}">{labelid}</a>', format='html')
    return elem


if __name__ == '__main__':
    pf.run_filter(action, doc=None)