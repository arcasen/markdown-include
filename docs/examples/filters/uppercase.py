import panflute as pf

def upper(elem, doc):
  if isinstance(elem, pf.Str):
    elem.text = elem.text.upper()

if __name__ == "__main__":
  pf.run_filter(upper)