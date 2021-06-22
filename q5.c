#include<stdio.h>
long long int hamming(long long int a,long long int b);
int main()
{
    long long int a;
    long long int b;
    printf("Enter 2 numbers :");
    scanf("%lld %lld",&a,&b);
    long long int c;
    c=hamming(a,b);
    printf("The hamming distance between %lld and %lld is %lld\n",a,b,c);
}