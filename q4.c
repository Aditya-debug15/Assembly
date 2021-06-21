#include<stdio.h>
void frequency(int *count_array,char *C);
int main()
{
    char C[35];
    scanf("%s",C);
    int count_array[26];
    count_array[5]=4;
    count_array[3]=4;
    count_array[10]=4;
    count_array[15]=4;
    count_array[25]=4;
    frequency(count_array,C);
    for(int i=0;i<26;i++)
    {
        printf("The count of %c is %d\n",'A'+i,count_array[i]);
    }
}