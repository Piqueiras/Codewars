#include <stddef.h>

float finduniq(const float *nums, size_t n)
{
  float x0=nums[0], x1=nums[1], x2=nums[2];
  float repeat;
  if (x0==x1){
    repeat = x0;
    if (x2!=x0) return x2;
  }
  else if (x0==x2){
    return x1;
  }
  else if (x1==x2){
    return x0;
  }
  for(int i=0; i<n; i++){
    if(nums[i]!=repeat){
      return nums[i];
    }
  }
}