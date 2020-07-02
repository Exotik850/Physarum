class Sys{
 Cell[] cells;
  Sys(int numcells){
    cells = new Cell[numcells];
    for(int i = 0; i < numcells; i++){
     cells[i] = new Cell(random(width), random(height)); 
    }
  }
  
  void update(){
   for(Cell c: cells) c.update();
  }
  
}
