NAME=libasm.a
NA=nasm
FL= -felf64
SRC= ft_read.s ft_write.s ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s
SRC_BONUS= ft_atoi_base_bonus.s 
OBJ= $(SRC:.s=.o)
OBJ_BONUS = $(SRC_BONUS:.s=.o)



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

bonus: $(OBJ_BONUS)
	ar rc $(NAME) $(OBJ_BONUS)	
	
test:
	gcc -no-pie  -o test   main.c  $(NAME) 
	./test
