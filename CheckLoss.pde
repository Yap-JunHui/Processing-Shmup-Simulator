void checkLoss()
{
  for (int i=0; i<enemies.size(); i++)
  {
    Enemy ta=(Enemy)enemies.get(i);
    if (inviFrame<=0)
    {
      if (ta.y <= (pY+18) && ta.y >= (pY-18) && ta.x <= (pX+15) && ta.x >= (pX-15))
      {
        lose=true;
      }
      if (ta.y <= (pY+18) && ta.y >= (pY-18) && (ta.x+ta.l) <= (pX+15) && (ta.x+ta.l) >= (pX-15))
      {
        lose=true;
      }
      if ((ta.y+2*ta.l) <= (pY+18) && (ta.y+2*ta.l) >= (pY-18) && ta.x <= (pX+15) && ta.x >= (pX-15))
      {
        lose=true;
      }
      if ((ta.y+2*ta.l) <= (pY+18) && (ta.y+2*ta.l) >= (pY-18) && (ta.x+ta.l) <= (pX+15) && (ta.x+ta.l) >= (pX-15))
      {
        lose=true;
      }
    }
  }
  if (lose)
  {
    p2=a2.loadFile("Shotgun+2.mp3");
    p2.play();
    pCount-=1;
    bCount=bCountf;
    power=1;
    pX=300;
    pY=560;
    resFrame=5;
    inviFrame=50;
    onFrame=0;
    playdur2=3;
    if (pCount>0)
    {
      for (int i=0; i<width; i++)
      {
        for (int j=0; j<height; j++)
        {
          for (int k=0; k<enemies.size(); k++)
          {
            Enemy ta=(Enemy)enemies.get(i);
            ta.health=0;
            if (ta.health<=0)
            {
              ta=null;
              enemies.remove(i);
              score+=(int(spd)*10/pCountf);
            }
            score++;
          }
        }
      }
    }
    lose=false;
  }
  if (pCount==0)
  {
    ko=true;
  }
}
