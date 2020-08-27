/*
 * ----------------------------------------
 * Kernel1 - JellyFish
 * jellyfish.c 
 * August 2020
 * ----------------------------------------
 * /

void kmain(void)
{
	const char *str = "Welcome to JellyFish 2020: Aashna's first kernel!";
	char *vidptr = (char*)0xb8000;    
	unsigned int i = 0;
	unsigned int j = 0;
	unsigned int screen;

	//loop to clear screen
	//25 lines of 80 columns; 2 bytes per element
	screen = 80*25*2
	while(j < screen) {
		vidptr[j] = ' ';   //blank character
		vidptr[j+1] = fx00;
		j = j + 2;
	}

	j = 0;


	//loop to write string to video memory
	while(str[j] != '\0') {
		vidptr[i] = str[j];    //store first char
		vidptr[i+1] = fx00;    //set colours : white bckg x black text
		++j;
		i = i + 2;
	}
	return;
}

