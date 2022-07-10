#include <stdio.h>
#include <gem5/m5ops.h>

#define MAX_POLYGONS (1024*256)

int transform(int value)
{
    value = value * 10;
}

struct polygon {
    float x[MAX_POLYGONS];
    float y[MAX_POLYGONS];
    float z[MAX_POLYGONS];
    int value[MAX_POLYGONS];
};

int main(int argc, const char *argv[])
{
    struct polygon p;

    // Reset gem5's statistics
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);

    for (unsigned int i = 0; i < MAX_POLYGONS; i++)
    {
        p.value[i] = transform(p.value[i]);
    }

    // Reset gem5's statistics
    m5_dump_stats(0, 0);
    m5_reset_stats(0, 0);

    return 0;
}

