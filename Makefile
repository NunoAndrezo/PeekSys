# Executable Name
NAME = deepsys

# Colors
GREEN = \033[0;32m
RED = \033[0;31m
CYAN = \033[0;36m
BLUE = \033[0;34m
YELLOW = \033[0;33m
NOCOLOR = \033[0m

# Compiler and Flags
CC = cc
CFLAGS = -Wall -Werror -Wextra -g

# Dependency Generation Flags
# -MMD: Generates dependency files (.d) while compiling
# -MF: Specifies where to write the dependency file
# -MP: Adds phony targets for headers (prevents errors if headers are deleted)
# -MT: Sets the target name in the dependency file
DEPFLAGS = -MT $@ -MMD -MP -MF $(OBJ_DIR)/$*.d

# Directories
SRC_DIR = src
OBJ_DIR = obj
INC_DIR = include

# Source files
SRC_FILES =	$(shell find $(SRC_DIR) -type f -name "*.c")

OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
DEPS = $(OBJ_FILES:.o=.d)

# Main targets
.PHONY: all clean fclean re libs

all: $(NAME)

# Create object directory
$(OBJ_DIR):
	@mkdir -p $@

# Compile objects
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(DEPFLAGS) $(CFLAGS) -I$(INC_DIR) -c $< -o $@
	@printf "$(CYAN)Compiled:$(NOCOLOR) %s\n" "$<"

# Final linking
$(NAME): $(OBJ_FILES) #libs (insert befre $(OBJ_FILES))
	@if [ "$(OBJ_FILES)" != "" ] && [ "$(filter-out libs,$?)" != "" ]; then \
		$(CC) $(CFLAGS) $(OBJ_FILES) -o $@ && \
		printf "$(GREEN)✓ $(NAME) built successfully$(NOCOLOR)\n" || \
		printf "$(RED)✗ Failed to build $(NAME)$(NOCOLOR)\n"; \
	elif [ ! -f $(NAME) ]; then \
		$(CC) $(CFLAGS) $(OBJ_FILES) -o $@ && \
		printf "$(GREEN)✓ $(NAME) built successfully$(NOCOLOR)\n" || \
		printf "$(RED)✗ Failed to build $(NAME)$(NOCOLOR)\n"; \
	else \
		printf "$(BLUE)Nothing to be done$(NOCOLOR)\n"; \
	fi

# Clean rules with precise messaging
clean:
	@if [ -d "$(OBJ_DIR)" ]; then \
		rm -rf $(OBJ_DIR) >/dev/null 2>&1; \
		printf "$(BLUE)✓ Object files removed$(NOCOLOR)\n"; \
	else \
		printf "$(BLUE)✓ Object files were already removed$(NOCOLOR)\n"; \
	fi

fclean: clean
	@if [ -f "$(NAME)" ]; then \
		rm -f $(NAME) >/dev/null 2>&1; \
		rm_flag=1; \
	fi; \
	if [ "$$rm_flag" = "1" ]; then \
		printf "$(BLUE)✓ All files cleaned$(NOCOLOR)\n"; \
	else \
		printf "$(BLUE)✓ Everything was already removed$(NOCOLOR)\n"; \
	fi

re: fclean all

-include $(DEPS)

## build all
#all: build

## Colors
#GREEN = \033[0;32m
#RED = \033[0;31m
#CYAN = \033[0;36m
#BLUE = \033[0;34m
#YELLOW = \033[0;33m
#NOCOLOR = \033[0m

## Name of the project
#NAME = peeksys

## Compiler
#CC = cc

## Flags
#CFLAGS = -Wall -Wextra -Werror -g
#POSTCC = -I $(INC_DIR) -L/usr/lib/x86_64-linux-gnu -L/usr/lib -lreadline -lncurses

## Directories
#SRC_DIR = ./src
#OBJ_DIR = ./obj
#INC_DIR = ./include

## Object directory
#$(OBJ_DIR):
#	@mkdir -p $(OBJ_DIR)

## Source files
#SRC_FILES = $(shell find $(SRC_DIR) -type f -name "*.c")

## Object files
#OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES)) 

## Total number of files and bar length
#TOTAL_FILES := $(words $(SRC_FILES))
#BAR_SYMBOL := ▓
#BAR_LENGTH := 50
#PROGRESS := 0

## Rule to compile .c into .o with progress bar
#$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
#	@mkdir -p $(dir $@)  # Create the directory if it doesn't exist
#	@$(CC) $(CFLAGS) -c $< -o $@
#	@$(eval PROGRESS := $(shell echo $$(($(PROGRESS) + 1))))
#	@$(eval PERCENT := $(shell echo $$(($(PROGRESS) * 100 / $(TOTAL_FILES)))))
#	@$(eval BAR := $(shell echo $$(($(PROGRESS) * $(BAR_LENGTH) / $(TOTAL_FILES)))))
#	@$(eval REST := $(shell echo $$(($(BAR_LENGTH) - $(BAR)))))
#	@echo -n "\r\033[K"  # Clear the line
#	@echo -n "$(CYAN)["  # Start the bar

#	@for i in `seq 1 $(BAR)`; do \
#		echo -n $(BAR_SYMBOL); \
#	done


#	@echo -n "] $(PERCENT)% $(RED)Compiling:$(NOCOLOR) $<"
##	@sleep 0.1  # Just to make the bar smooth


## Rule to compile the project
#$(NAME): $(OBJ_FILES)
#	@echo ""
#	@echo "$(YELLOW)Creating $(NAME)..."
#	@$(CC) $(CFLAGS) $(POSTCC) $(OBJ_FILES) -o $(NAME) -L/usr/lib/x86_64-linux-gnu -lreadline -lncurses
#	@sleep 0.2 # Just to let the loading bar finish smoothly
#	@echo -n "\r\033[K" # Erase the loading bar
#	@echo "$(GREEN)$(NAME) created successfully.$(NOCOLOR)"

## build the project
#build: $(NAME)

## clean the object files
#clean:
#	@rm -rf $(OBJ_DIR)
#	@echo "$(BLUE)Object files removed.$(NOCOLOR)"
#	@echo "$(GREEN)Clean done.$(NOCOLOR)"

## clean the object files and the project
#fclean: clean
#	@rm -f $(NAME)
#	@echo "$(BLUE)Project removed.$(NOCOLOR)"
#	@echo "$(GREEN)Full clean done.$(NOCOLOR)"

## clean and rebuild the project
#re: fclean all

## run the project
#run: build
#	@./$(NAME)

#.PHONY: all clean fclean re run build