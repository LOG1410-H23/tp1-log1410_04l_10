CC=gcc
LDFLAGS=-lm
EXEC=newton
INSTALL_DIR=install

# default command, builds an executable called "newton".
# executable can be called with ./newton 49 4
all: $(EXEC)

# creates the install directory if it does not exist
# and copies the newton executable to the install directory.
install: $(EXEC)
	@mkdir -p $(INSTALL_DIR)
	@cp $(EXEC) $(INSTALL_DIR)

# link the object files into the executable.
# the -lm option is to tell the linker to include math libraries.
$(EXEC): main.o newton.o
	$(CC) -o $@ $^ $(LDFLAGS)

# compile the main.c file into the main.o object file.
main.o: main.c newton.h
	$(CC) -o $@ -c $<

# compile the newton.c file into the newton.o object file.
newton.o: newton.c newton.h
	$(CC) -o $@ -c $<

# remove the executable and intermediary object files.
clean:
	rm -rf *.o $(EXEC)


