#include<stdio.h>
void rotate(int *A);
int main()
{
    int A[8][8];
    int count=1;
    for(int i=0;i<8;i++)
    {
        for(int j=0;j<8;j++)
        {
            A[i][j]=count;
            count++;
        }
    }
    for(int i=0;i<8;i++)
    {
        for(int j=0;j<8;j++)
        {
            printf("%d ",A[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    rotate(*A);
    for(int i=0;i<8;i++)
    {
        for(int j=0;j<8;j++)
        {
            printf("%d ",A[i][j]);
        }
        printf("\n");
    }
}