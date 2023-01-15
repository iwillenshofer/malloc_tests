# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iwillens <iwillens@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/23 17:38:02 by iwillens          #+#    #+#              #
#    Updated: 2023/01/12 20:09:10 by iwillens         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
# *** Main Definitions                                                         #
# **************************************************************************** #

NAME = test

CC = gcc
CCFLAGS = -Wall -Werror -Wextra -std=c89 -fsanitize=address -g -fvisibility=hidden 

# **************************************************************************** #
# *** Libft Definitions                                                        #
# **************************************************************************** #
LIBFT_DIR = ./tests/libft
LIBFT = ${LIBFT_DIR}/libft.a

# **************************************************************************** #
# *** Malloc Definitions                                                       #
# **************************************************************************** #
MALLOC_DIR = ./ft_malloc
MALLOC_INC_DIR = ${MALLOC_DIR}/includes
MALLOC = ${MALLOC_DIR}/libft_malloc_x86_64_Darwin.so

# **************************************************************************** #
# *** Tester Definitions                                                       #
# **************************************************************************** #
NAME = tester
SRC_DIR = ./tests
OBJ_DIR = ./tests/build
INCLUDES = ${SRC_DIR}/tests.h

TESTS = ${SRC_DIR}/main.c \
		${SRC_DIR}/test_helpers.c \
		${SRC_DIR}/test_alloc.c \
		${SRC_DIR}/test_realloc.c \
		${SRC_DIR}/test_free.c \
		${SRC_DIR}/fake_show_alloc_mem.c

OBJS = $(patsubst ${SRC_DIR}/%.c, ${OBJ_DIR}/%.o, ${TESTS})


# **************************************************************************** #
# *** Definitions for the Original Malloc                                      #
# **************************************************************************** #
ORIGINAL_NAME = tester_original
ORIGINAL_OBJ_DIR = ./tests/build2
ORIGINAL_OBJS = $(patsubst ${SRC_DIR}/%.c, ${ORIGINAL_OBJ_DIR}/%.o, ${TESTS})

# **************************************************************************** #
# *** Main Rules                                                               #
# **************************************************************************** #

all: title ${NAME} ${ORIGINAL_NAME}

${NAME}: ${MALLOC} ${LIBFT} ${OBJS} Makefile
	@${CC} ${CCFLAGS}  ${OBJS}  -I. -I ${SRC_DIR} -I ${LIBFT_DIR} -L${LIBFT_DIR} -lft -L${MALLOC_DIR} -rpath @executable_path/${MALLOC_DIR}  -lft_malloc -o ${NAME}
	@echo "\033[92m${NAME} is built. \033[0m"
	
${OBJ_DIR}/%.o: ${SRC_DIR}/%.c ${MALLOC_INC_DIR} ${INCLUDES} Makefile
	@mkdir -p $(dir $@)
	@${CC}  ${CCFLAGS} -c $< -I. -I ${MALLOC_INC_DIR} -I ${SRC_DIR}  -I ${LIBFT_DIR} -o $@



# **************************************************************************** #
# *** Rules for the Original Malloc                                            #
# **************************************************************************** #

${ORIGINAL_NAME}: ${LIBFT} ${ORIGINAL_OBJS} Makefile
	@${CC} ${CCFLAGS} -DORIGINAL_MALLOC ${ORIGINAL_OBJS}  -I. -I${SRC_DIR} -I${LIBFT_DIR} -L${LIBFT_DIR} -lft -o ${ORIGINAL_NAME}
	@echo "\033[92m${ORIGINAL_NAME} is built. \033[0m"
	
${ORIGINAL_OBJ_DIR}/%.o: ${SRC_DIR}/%.c ${INCLUDES} Makefile
	@mkdir -p $(dir $@)
	@${CC}  ${CCFLAGS} -DORIGINAL_MALLOC  -c $< -I. -I${SRC_DIR} -I${LIBFT_DIR} -o $@

# **************************************************************************** #
# *** Libft Rules                                                              #
# **************************************************************************** #

${LIBFT}:
	@make -C ${LIBFT_DIR}

${MALLOC}:
	@make -C ${MALLOC_DIR}

# **************************************************************************** #
# *** Common Rules                                                             #
# **************************************************************************** #
clean:
	@rm -rf ${OBJ_DIR}
	@rm -rf ${ORIGINAL_OBJ_DIR}
	@make -C ${LIBFT_DIR} clean
	@make -C ${MALLOC_DIR} clean

fclean: clean
	@rm -rf  ./${NAME} ./${ORIGINAL_NAME}
	@make -C ${LIBFT_DIR} fclean
	@make -C ${MALLOC_DIR} fclean

re: fclean all

title:
	@echo "\033[0m\033[38;2;123;145;255m _         _  _  _"
	@echo "\033[38;2;87;115;255m<_> _ _ _ <_>| || | ___ ._ _  ___"
	@echo "\033[38;2;207;59;255m| || | | || || || |/ ._>| ' |<_-<"
	@echo "\033[38;2;255;135;255m|_||__/_/ |_||_||_|\___.|_|_|/__/\033[0m\n"
	@echo "\033[37;1m      * * * malloc * * *\033[0m\n"

time: all
	time ./tester >& /dev/null
	time ./tester_original >& /dev/null