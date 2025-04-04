match($0, /^\[\[([^]]+)\]\] *$/, a) {
  gsub(/^ +| +$/, "", a[1]); # 去除 a[1] 前后的空格
  if (!seen[a[1]]++) {
    files = (files ? files " " : "") a[1]
  }
}
END {
  if (files) {
    sub(/^docs\//, "", FILENAME);
    print FILENAME ": " files
  }
}
