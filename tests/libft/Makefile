# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iwillens <iwillens@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/01 10:55:01 by iwillens          #+#    #+#              #
#    Updated: 2023/01/12 10:25:48 by iwillens         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#          a Limited version of libft specific for the malloc project          #
# **************************************************************************** #

NAME = libft.a

SRCS =  ft_color.c \
			ft_putchar.c \
			ft_puthex.c \
			ft_putnbr.c \
			ft_putstr.c \
			ft_strlen.c \
			ft_memset.c

OBJS = $(patsubst %.c, %.o, $(SRCS))

all : $(NAME)

$(NAME) : $(OBJS)
		@ar -r $(NAME) $(OBJS) &> /dev/null
		@echo "\033[95mtester ${NAME} is built. \033[0m"

%.o: %.c
		@gcc -c -Wall -Wextra -Werror $< -o $@ -fvisibility=hidden

clean: 
		@rm -f $(OBJS)

fclean : clean
		@rm -f $(NAME)

re : fclean libft.a
