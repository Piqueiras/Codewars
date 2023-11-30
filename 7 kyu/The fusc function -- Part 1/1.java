public class Kata {
  public static int fusc(int n) {
    if (n == 0 || n == 1){
      return n;
    }
    if (n % 2 == 0){
      return fusc(n/2);
    }
    else{
      return fusc((n-1)/2) + fusc((n-1)/2 + 1);
    }
  }
}