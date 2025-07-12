#!/usr/bin/env python3

from panflute import *

def prepare(doc):
    pass

def action(elem, doc):
    if isinstance(elem, Div) and doc.format == 'latex':
        # 获取 div 的 class 列表
        classes = set(elem.classes)
        
        # 如果 div 有 class，则转换为对应的 LaTeX 环境
        if classes:
            # 获取第一个 class 作为环境名
            env_name = elem.classes[0]

            label = '\\label{' + elem.identifier + '}' if elem.identifier else ''
            
            # 创建 LaTeX 环境
            begin_env = RawBlock(f'\\begin{{{env_name}}}' + label, format='latex')
            end_env = RawBlock(f'\\end{{{env_name}}}', format='latex')
            
            # 返回由环境包裹的内容
            return [begin_env] + list(elem.content) + [end_env]

def finalize(doc):
    pass
#     # 添加 LaTeX 前置内容
#     if doc.format == 'latex':
#         if 'header-includes' not in doc.metadata:
#             doc.metadata['header-includes'] = MetaList()
        
#         header = RawBlock(r"""
# \usepackage{amsthm}
# \newtheorem{theorem}{\indent 定理}[section]
# \renewcommand{\proofname}{\indent\bfseries 证明}
# """, format='latex')
#         doc.metadata['header-includes'].append(header)


if __name__ == '__main__':
    run_filter(action, prepare=prepare, finalize=finalize, doc=None)