#!/usr/bin/env python3

from panflute import *


def action(elem, doc):
    # 处理表格：在表格前插入 \rowcolors（LaTeX）或添加 CSS 类（HTML）
    if isinstance(elem, Table):
        if doc.format == "latex":
            # LaTeX 方式：插入 \rowcolors 命令
            color_cmd = RawBlock("\\rowcolors{1}{white}{cyan!15}", format="latex")
            return [color_cmd, elem]
        elif doc.format == "html":
            # HTML 方式：为表格添加 CSS 类
            elem.classes = ["striped-table"]
            return elem

def finalize(doc):
    # HTML 输出时插入 CSS 样式
    if doc.format == "html":
        css = """<style>
            table.striped-table tr:nth-child(even) { background: #f0f0f0; }
        </style>"""
        doc.metadata["header-includes"] = MetaBlocks(RawBlock(css, format="html"))


if __name__ == "__main__":
    run_filter(action, finalize=finalize, doc=None)