TARGETS = helloworld-1.tex helloworld-2.tex helloworld-3.tex helloworld-4.tex diff1 diff2 diff3

all: $(TARGETS)

helloworld-1.tex: helloworld.md
	pandoc $< -s -o $@

helloworld-2.tex: helloworld.md preamble-filter 
	pandoc $< --filter preamble-filter -s -o $@

helloworld-3.tex: helloworld.md preamble-filter 
	pandoc $< --include-in-header=preamble.tex -s -o $@

helloworld-4.tex: helloworld.md preamble-filter preamble.tex
	pandoc $< --filter preamble-filter --include-in-header=preamble.tex -s -o $@

# 在 Makefile 中使用 diff 命令时，如果 diff 检测到文件之间存在差异，
# 它会返回非零退出状态码（通常是 1），这会导致 make 认为命令失败并停止执行。
diff1: helloworld-1.tex helloworld-2.tex
	diff $^ > $@ || true

diff2: helloworld-1.tex helloworld-3.tex
	diff $^ > $@ || true

diff3: helloworld-1.tex helloworld-4.tex
	diff $^ > $@ || true

clean:
	rm -f $(TARGETS)

.PHONY: all clean