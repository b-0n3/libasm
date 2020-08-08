NAME=libasm.a
NA=nasm
FL= -felf64
SRC= ft_read.s ft_write.s ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s
OBJ= $(SRC:.s=.o)



%.o: %.s
	$(NA) $(FL)  $<

all: $(NAME) 

$(NAME): $(OBJ)
	ar rc  $(NAME)  $(OBJ)
clean:
	rm -f $(OBJ)
fclean: clean
	rm -f $(NAME) test 
re: fclean $(NAME)

test:
	gcc -no-pie  -o test   main.c  $(NAME) 
	./test
