/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_helpers.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: iwillens <iwillens@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/01 10:41:51 by iwillens          #+#    #+#             */
/*   Updated: 2023/01/12 10:32:00 by iwillens         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "tests.h"

void	test_title(char *s)
{
	ft_color(BLUE, BOLD);
	ft_putchar('\n');
	ft_putstr("*** ");
	ft_putstr(s);
	ft_putchar('\n');
	ft_color(RESET, REGULAR);
}

void	test_subtitle(char *s)
{
	ft_putstr("--- ");
	ft_color(CYAN, BOLD);
	ft_putstr(s);
	ft_putchar('\n');
	ft_color(RESET, REGULAR);
}

void	test_description(char *s)
{
	ft_putstr("    ");
	ft_color(BLACK, ITALIC);
	ft_putstr(s);
	ft_putchar('\n');
	ft_color(RESET, REGULAR);
}
