#ifndef CLI_H
#define CLI_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef struct s_cli
{
	char *command;  // Command to execute
	char **options; // Array of options
	int option_count; // Number of options
	int verbose; // Verbose mode flag
	int help; // Help flag
	int version; // Version flag
	int debug; // Debug mode flag
	char *output_file; // Output file for results
} t_cli;

void	cli_check(int ac, char **av);

#endif