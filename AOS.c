#include <stdio.h>
#include <gem5/m5ops.h>

#define MAX_POLYGONS (1024*256)

int transform(int value)
{
    value = value * 10;
}

struct polygon
{
    float x, y, z;
    int value;
};

int main(int argc, const char *argv[])
{
    struct polygon pArray[MAX_POLYGONS];

    // Reset gem5's statistics
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);

    for (unsigned int i = 0; i < MAX_POLYGONS; i++)
    {
        pArray[i].value = transform(pArray[i].value);
    }

    // Reset gem5's statistics
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);

    return 0;
}

