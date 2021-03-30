/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hyunkim <hyunkim@student.42.kr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/28 23:12:46 by hyunkim           #+#    #+#             */
/*   Updated: 2021/03/30 18:08:02 by hyunkim          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void			test_strlen_strdup(void)
{
	char		str[2048];
	char		str2[2048];

	printf(Y"====================\n");
	printf("==    ft_strlen   ==\n");
	printf("====================\n");
	printf(G"<test>\n");
	printf("input a string      ===> : ");
	scanf("%s", str);
	printf(R"<result>\n");
	printf("   strlen : %lu\n", strlen(str));
	printf("ft_strlen : %zu\n", ft_strlen(str));
	getchar();
	printf("\n\n\n"Y"====================\n");
	printf("==    ft_strdup   ==\n");
	printf("====================\n");
	printf(G"<test>\n");
	printf("input a string  ===> : ");
	scanf("%s", str2);
	printf(R"<result>\n");
	printf("   strdup : %s\n", strdup(str2));
	printf("ft_strdup : %s\n", ft_strdup(str2));
	getchar();
}

void			test_strcpy(void)
{
	char		s1[1024];
	char		s2[1024];
	char		*dest1;
	char		*dest2;

	printf("\n\n\n"Y"====================\n");
	printf("==    ft_strcpy   ==\n");
	printf("====================\n");
	printf(G"<test>\n");
	printf("input a string SRC  ===> : ");
	scanf("%s", s1);
	printf("input a string DEST ===> : ");
	getchar();
	scanf("%s", s2);
	dest1 = strdup(s1);
	dest2 = strdup(s2);
	printf(R"<result>\n");
	printf("   strcpy : %s\n", strcpy(s2, s1));
	printf("ft_strcpy : %s\n", ft_strcpy(dest2, dest1));
	getchar();
}

void			test_strcmp(void)
{
	char		str1[1024];
	char		str2[1024];

	printf("\n\n\n"Y"====================\n");
	printf("==    ft_strcmp   ==\n");
	printf("====================\n");
	printf(G"<test>\n");
	printf("input a string str1 ===> : ");
	scanf("%s", str1);
	getchar();
	printf("input a string str2 ===> : ");
	scanf("%s", str2);
	printf(R"<result>\n");
	printf("   strcmp : %d\n", strcmp(str1, str2));
	printf("ft_strcmp : %d\n", ft_strcmp(str1, str2));
	getchar();
}

void			test_write_read(void)
{
	int			fd;
	int			ret;
	char		buff[1024];

	printf("\n\n\n"Y"====================\n");
	printf("==ft_write & read==\n");
	printf("====================\n");
	printf(G"Enter the contents of the test.txt file \n"S);
	fd = open("./test.txt", O_CREAT | O_TRUNC | O_RDWR, 777);
	scanf("%[^\n]", buff);
	getchar();
	printf(G"\nCreating test.txt file using ft_write() function . . . (3s)\n");
	sleep(3);
	ft_write(fd, buff, ft_strlen(buff));
	close(fd);
	printf(R"test.txt file Creation Complete\n\n");
	fd = open("./test.txt", O_RDONLY);
	printf(G"Reading test.txt file using ft_read() function . . . (3s)\n");
	ret = ft_read(fd, buff, ft_strlen(buff));
	buff[ret] = '\0';
	sleep(3);
	printf(R"File read completion\n");
	printf("\ntest.txt is \n%s", buff);
	close(fd);
}

int				main(void)
{
	test_strlen_strdup();
	test_strcpy();
	test_strcmp();
	test_write_read();
	return (0);
}
