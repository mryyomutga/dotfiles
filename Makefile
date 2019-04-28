CANDIDATES := $(wildcard src/.??* src/.config/* src/.local/bin/*)
EXCLUSIONS := src/.config src/.local
DOTFILES := $(patsubst src/%,%, $(filter-out $(EXCLUSIONS), $(CANDIDATES)))

all:

install:
	@{ \
		make -s list; \
		} | \
		sort | \
		uniq -u | \
		xargs -I{} ln -fnsv $(abspath src/{}) $(HOME)/{}

list:
	@$(foreach f, $(DOTFILES), echo $(f);)

clean:
	@$(foreach f, $(DOTFILES), unlink $(HOME)/$(f);)
