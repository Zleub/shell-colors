NAME = libcolors.a
SRC = colors.c
OBJ = $(SRC:.c=.o)

CC = clang
CFLAGS = \
	-O3 \
	-Wall \
	-Werror \
	-Wextra
LDFLAGS = -L. -lcolors

all: colors.h $(NAME) test

%.c: %.c4
	m4 $< > $@

%.h: %.h4
	m4 $< > $@

$(NAME): $(OBJ)
	ar rc $@ $^
	ranlib $@

clean:
	rm -rf $(OBJ)
	rm -rf main.o

fclean: clean
	rm -rf $(NAME) colors.h a.out

re: fclean all

test: main.o
	$(CC) $(CFLAGS) $(LDFLAGS) main.o

.PHONY: all $(NAME) clean fclean re test
