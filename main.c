#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
int ft_strlen(const char *str);
char *ft_strcpy(char *dest , char *src);

int ft_strcmp(char *s1, char *s2);
char *ft_strdup(char *str);
int ft_write(int fd ,char *buffer, int len);
int ft_read(int fd,char *buffer, int per);
#define PRT(X) printf("\n%s\n",X);
#define STRDUP(X) printf("%s \n", ft_strdup(X));
#define STRLEN(X) printf("%d , %d \n", ft_strlen(X) ,(int) strlen(X));
#define STRCPY(X,Y) printf("%s  \n ", ft_strcpy(X,Y));
#define STRCMP(X,Y) printf("%d, %d \n", ft_strcmp(X,Y), strcmp(X,Y));

#define FT_WRITE(X,Y) printf (" %d   %d \n ", ft_write( 1 , X , Y ), write (1, X,Y) );
#define READ(X,Y,Z) printf("%d \n " , ft_read(X,Y,Z) );
int main()
{
	PRT ("testing strlen")
	STRLEN("a")
	STRLEN("HELLO")
	PRT("END TESTING STRLEN >> start testing ft_strcpy ...  ")
	char buffer[100];
	STRCPY(buffer, "hello")
	printf("%s",buffer); 
	PRT ("end testing strcpy")
	STRCMP("HELLO", "HBOE")
		
	STRCMP("A", "A")
		
	STRCMP("BB", "BBB")
		
	STRCMP("AB", "A")
	PRT("testing ft_strdup")
	STRDUP("SIR THEWA ")
	char *str = "this from write \n";
	FT_WRITE(str, ft_strlen(str))
	int fd = open("./ft_strcmp.s" , O_RDONLY);
	char my[100];
	PRT("testing read")
	READ(0, my , 10)
	my[10] = '\0';
	FT_WRITE(my,10)
	return 0;
}
