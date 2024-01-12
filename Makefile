ASM			=	nasm

CC			=	ld

SRC			=	strlen.asm			\
				strchr.asm			\
				strrchr.asm			\
				strcmp.asm			\
				strncmp.asm			\
				memset.asm			\
				memcpy.asm

DIR_SRC 	= 	src/

SRCS		= $(addprefix $(DIR_SRC), $(SRC))

OBJ			= 	$(SRCS:.asm=.o)

NAME		=	libasm.so

CFLAGS		=	-fPIC -shared

ASMFLAGS =		-f elf64

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -shared -fPIC -o $(NAME) $(OBJ)

.PHONY: all