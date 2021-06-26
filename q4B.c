#include<stdio.h>
void frequency(int *count_array,char *C);
int main()
{
    char C[35];
    printf("Enter the string \n");
    for(int i=0;i<32;i++)
    {
        scanf("%c",&C[i]);
    }
    int count_array[26];
    frequency(count_array,C);
    for(int i=0;i<26;i++)
    {
        printf("The count of %c is %d\n",'A'+i,count_array[i]);
    }
}
