char findMissingLetter(char array[], int arrayLength)
{
  for(int i = 0; i<arrayLength; i++){
    if(array[i]+1!=(array[i+1])){
      return (array[i]+1);
    }
  }
}