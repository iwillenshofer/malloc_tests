/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_alloc.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: iwillens <iwillens@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/01 15:04:09 by igorwillens       #+#    #+#             */
/*   Updated: 2023/01/12 20:45:16 by iwillens         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "tests.h"
#include <stdio.h>

void	test_alloc_101_tiny()
{
    size_t i;
	size_t qty = 50000;
	size_t size = 5000;
	char *c[qty];
    i = 0;

    while (i < qty)
	{
       c[i] = malloc(size);
	   ft_memset(c[i], 'a', size);
	   i++;
	}
    i = 0;
    while (i < qty)
	{
       write(1, c[i], size);
	   i++;
	}
    i = 0;
    while (i < qty)
	{
       free(c[i]);
	   i++;
	}
}

/*
void	test_alloc_101_small()
{
    size_t i;

    i = 0;
    test_subtitle("101 Small allocs");
    test_description("inserting 101 allocs of the LIMIT_SMALL");
	show_alloc_mem();
    while (++i <= 101)
        malloc(LIMIT_SMALL);
	show_alloc_mem();
	test_free_all();
}

void	test_alloc_100_small()
{
    size_t i;

    i = 0;
    test_subtitle("100 Small allocs");
    test_description("inserting 100 allocs of the LIMIT_SMALL");
    while (++i <= 100)
    {
        ft_putnbr(i);
        ft_putchar('\n');
        malloc(LIMIT_SMALL);
    }
	test_free_all();
}



void	test_alloc_100_tiny()
{
    size_t i;

    i = 0;
    test_subtitle("100 Tiny allocs");
    test_description("inserting 100 allocs of the LIMIT_TINY");
    while (++i <= 100)
        malloc(LIMIT_TINY);
	show_alloc_mem();
	test_free_all();
}

void	test_alloc_power()
{
    size_t i;
	size_t j;

    i = 0;
	j = 0;
    test_subtitle("Alloc Power");
    test_description("A Huge allocation");
    while (++i <= 2)
	{
		while (++j <= 40000)
		{
			printf("%lu\n", j);
			malloc(j);
		}
	show_alloc_mem();
	}

}
*/
void    test_alloc(void)
{
    test_title("testing allocation");
    test_alloc_101_tiny(); 
/*    test_alloc_101_tiny();
	test_alloc_100_small();
    test_alloc_101_small();
	test_alloc_power();*/
}
