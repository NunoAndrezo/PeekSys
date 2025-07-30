#include "../include/cli.h"

static void check_options(int ac, char **av);

void	cli_check(int ac, char **av)
{
	if (ac < 1)
	{
		fprintf(stderr, "Usage: %s [options]\n", "'PeekSys' or 'peeksys'");
		exit(EXIT_FAILURE);
	}
	else if (ac == 1)
	{
		//run_everything();
		printf("placeholder for everything\n");
		exit(EXIT_SUCCESS);
	}
	else
		check_options(ac, av);
}

static void check_options(int ac, char **av)
{
	int	i = 1;

	while (i < ac)
	{
		if (strcmp(av[i], "--help") == 0)
		{
			printf("PeekSys - System Information Tool\n");
			printf("Show system information and diagnostics.\n");
			printf("=================================\n");
			printf("Usage: %s [options]\n", av[0]);
			printf("Options:\n");
			printf("  --os\t\tShow operating system information\n");
			printf("  --cpu\t\tShow CPU information\n");
			printf("  --gpu\t\tShow GPU information\n");
			printf("  --motherboard\tShow motherboard information\n");
			printf("  --ram\t\tShow memory information\n");
			printf("  --disk\t\tShow disk information\n");
			printf("  --network\t\tShow network and net speeds information\n");
			printf("  --temp\t\tShow temperature information\n");
			printf("  --display\t\tDisplay system information\n");
			printf("  --battery\tShow battery information\n");
			printf("  --all, --complete\tShow all information\n");
			printf("  --help\t\tShow this help message\n");
			printf("  --version\t\tShow version information\n");
			printf("\nFull documentation <https://github.com/NunoAndrezo/PeekSys>\n");

			exit(EXIT_SUCCESS);
		}
		else if (strcmp(av[i], "--version") == 0)
		{
			printf("%s version 1.0.0\n", av[0]);
			exit(EXIT_SUCCESS);
		}
		else if (strcmp(av[i], "--os") == 0 || strcmp(av[i], "--cpu") == 0 ||
		         strcmp(av[i], "--gpu") == 0 || strcmp(av[i], "--motherboard") == 0 ||
		         strcmp(av[i], "--ram") == 0 || strcmp(av[i], "--disk") == 0 ||
		         strcmp(av[i], "--network") == 0 || strcmp(av[i], "--temp") == 0 ||
		         strcmp(av[i], "--display") == 0 || strcmp(av[i], "--battery") == 0 ||
		         strcmp(av[i], "--complete") == 0 || strcmp(av[i], "--all") == 0)
		{
			// Handle the options accordingly
			printf("Option '%s' recognized.\n", av[i]);
			//call_correct_option(av[i]); // Placeholder for actual option handling
		}
		else
		{
			fprintf(stderr, "Error: Unknown option '%s'.\n", av[i]);
			exit(EXIT_FAILURE);
		}
		i++;
	}

}