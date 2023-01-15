/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tests.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: iwillens <iwillens@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/01 10:34:30 by iwillens          #+#    #+#             */
/*   Updated: 2023/01/12 19:24:42 by iwillens         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef TESTS_H
# define TESTS_H

# ifdef ORIGINAL_MALLOC
#  include <stdlib.h>
# else
#  include "libft_malloc.h"
# endif

# include "libft.h"

void	test_free_all(void);
void	test_alloc(void);
void	test_title(char *s);
void	test_subtitle(char *s);
void	test_description(char *s);

# ifdef ORIGINAL_MALLOC 
void	show_alloc_mem(void);
# endif

#endif
