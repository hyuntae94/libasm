ASMSRC		= $(wildcard *.s)
ASMOBJ		= $(ASMSRC:.s=.o)

NAME		= libasm.a
RM			= rm -rf
LIB			= ar rc
CC			= gcc
CFLAGS		= -g -fsanitize=address
NASM		= nasm
NASMFLAGS	= -f macho64

%.o	: %.s
	$(NASM) $(NASMFLAGS) $<

all 	: $(NAME)

clean	:
		$(RM) $(ASMOBJ) *.out *.dSYM

fclean	: clean
		$(RM) $(NAME)

re		: fclean all

test	: all
	$(CC) $(CFLAGS) test.c $(NAME)

$(NAME): $(ASMOBJ)
	$(LIB) $(NAME) $(ASMOBJ)
