#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char paint(char x, char y){
  if(x==y)
    return x;
  if((x=='R' && y=='B') || (x=='B' && y=='R'))
    return 'G';
  if((x=='R' && y=='G') || (x=='G' && y=='R'))
    return 'B';
    return 'R';
}

char triangle(const char *clrs)
{
  int len = strlen(clrs);
  char words[len];
  strcpy(words, clrs);
  while (len>1){
    for(int i=0;i<len-1;i++){
      words[i] = paint(words[i],words[i+1]);
    }
    len--;
  }
  return words[0];
}