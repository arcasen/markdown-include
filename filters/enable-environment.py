#!/usr/bin/env python3

from panflute import *

def prepare(doc):
    pass

def action(elem, doc):
    if isinstance(elem, Div) and doc.format == 'latex':
        # 获取 div 的属性
        classes = elem.classes
        identifier = elem.identifier
        attributes = elem.attributes
        
        # 如果 div 有 class，则转换为对应的 LaTeX 环境
        if classes:
            # 获取第一个 class 作为环境名
            env_name = elem.classes[0]

            # 处理 id (转换为 \label)
            label = f'\\label{{{identifier}}}' if elem. identifier else ''

            # 处理其它类名 (如: .cls1 .cls2)
            cls_str = ','.join(f'{cls}' for cls in classes[1:]) if classes[1:] else ''
            
            # 处理自定义属性 (如: key1=val1 key2= val2)
            attr_str = ','.join([f'{key}={value}' for key, value in attributes.items()]) if attributes else ''
            
            # 生成 LaTeX 环境的参数
            # 用逗号连接有效字符串, 并过滤掉空字符串（None 或 ""）
            opt_str = ','.join([s for s in [cls_str, attr_str] if s])
            opt_str = f'[{opt_str}]' if opt_str else ''
            
            # 创建 LaTeX 环境
            begin_env = RawBlock(f'\\begin{{{env_name}}}' + opt_str + label, format='latex')
            end_env = RawBlock(f'\\end{{{env_name}}}', format='latex')
            
            # 如果有 label，将其插入到 div 内容开头
            content = list(elem.content)

            # 返回新的元素列表：开始环境 + 内容 + 结束环境
            return [begin_env] + content + [end_env]

def finalize(doc):
    pass


if __name__ == '__main__':
    run_filter(action, prepare=prepare, finalize=finalize, doc=None)
