NAME = libcolors.a
SRC = colors.c
OBJ = $(SRC:.c=.o)

CC = clang
CFLAGS = \
	-O3 \
	-Wall \
	-Werror \
	-Wextra
LDFLAGS =

all: colors.h $(NAME)

%.c: %.c4
	m4 $< > $@

%.h: %.h4
	m4 $< > $@

$(NAME): $(OBJ)
	ar rc $@ $^
	ranlib $@

clean:
	rm -rf $(OBJ)

fclean:
	rm -rf $(NAME) $(OBJ) colors.h

re: fclean all

.PHONY: all $(NAME) clean fclean re
