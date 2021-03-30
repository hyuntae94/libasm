#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <string.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdlib.h>

# define R "\x1b[31m"
# define G "\x1b[32m"
# define Y "\x1b[33m"
# define S "\x1b[0m"

size_t		ft_strlen(const char *s);
int			ft_strcmp(const char *s1, const char *s2);
char		*ft_strcpy(const char *dst, const char *src);
char		*ft_strdup(const char *s1);
int			ft_write(int fd, void *buff, size_t nbyte);
int			ft_read(int fd, void *buff, size_t nbyte);

#endif
