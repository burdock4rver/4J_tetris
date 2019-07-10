public class RandomMino {

    int nextMino1[] = new int[7];
    int nextMino2[] = new int[14];
    boolean firstFlag = false;
    int q_point = 0;
  
   public void randomMino() {  //  次にくるブロックの生成
    int flag[] = new int[7];
    int rand;
     for(int i = 0;i < 7;i++){
       while(true){
         rand = (int)random(1,8);
         if(flag[rand - 1] != 1){
           flag[rand - 1] = 1;
           break;
         }
       }
       nextMino1[i] = rand;
     }
    }
    
    public void nextMino(){
      
      if(firstFlag == false){
        randomMino();
        for(int i = 0;i < 7;i++){
          nextMino2[i] = nextMino1[i];
        }
        randomMino();
        for(int i = 0;i < 7;i++){
          nextMino2[i+7] = nextMino1[i];
        }
        firstFlag = true;
      }else{
      
        if(q_point == 8){
          randomMino();
          for(int i = 0;i < 7;i++){
            nextMino2[i] = nextMino1[i];
          }
        }else{
        if(q_point == 0);
          randomMino();
          for(int i = 0;i < 7;i++){
            nextMino2[i+7] = nextMino1[i];
          } 
      }
      }
    }
    
    public int getNextMino(){
      int next;
      if(q_point == 14)  q_point = 0;
      if(q_point == 0 || q_point == 8) nextMino();
      next = nextMino2[q_point];
      
      q_point++;
      return (next);
    }
  
}
