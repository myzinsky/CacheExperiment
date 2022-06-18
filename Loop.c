#include <stdio.h>
#include <gem5/m5ops.h>

#define HEIGHT 1024
#define WIDTH  768

int image[HEIGHT * WIDTH];

int transform(int *value)
{
    *value = *value * 10;
}

int main(int argc, const char *argv[])
{
    printf("Start Algorithm\n");

    // Reset gem5's statistics
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);

    for (unsigned int j = 0; j < WIDTH; j++)
    //for (unsigned int i = 0; i < HEIGHT; i++)
    {
    	for (unsigned int i = 0; i < HEIGHT; i++)
        //for (unsigned int j = 0; j < WIDTH; j++)
        {
            transform(&image[i*WIDTH + j]);
        }
    }
    //m5_dump_stats(0,0);
    printf("End Algorithm\n");
    return 0;
}

