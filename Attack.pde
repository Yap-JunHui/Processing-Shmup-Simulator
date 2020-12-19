void atk()
{
  if (mousePressed && mouseButton == LEFT && resFrame<0)
  {
    shoot=true;
  }
  if (shoot)
  {
    if (power>=1 && power<2)
    {
      for (int i=0; i<enemies.size(); i++)
      {
        Enemy ta=(Enemy)enemies.get(i);
        if (pX < ta.x + ta.l && pX > ta.x && ta.y < pY)
        {
          ta.health-=20;
          noStroke();
          fill(255, 255, 120, 180);
          ellipse(pX, ta.y + ta.l*2, 15, 15);
          if (ta.health<=0)
          {
            if (ta.type==3)
            {
              fill(255);
              ellipse((ta.x+ta.l/2), (ta.y+ta.l), ta.l*6.5, ta.l*6.5);
              if ((ta.y-ta.l*2) <= (pY+18) && (ta.y+ta.l*4) >= (pY-18) && (ta.x-ta.l*2.5) <= (pX+15) && (ta.x+ta.l*3.5) >= (pX-15))
              {
                lose=true;
              }
            }
            ta=null;
            enemies.remove(i);
            score+=(int(spd)*10/pCount);
            power+=0.05;
          }
          score++;
        }
      }
    }
    if (power>=2 && power<4)
    {
      for (int i=0; i<enemies.size(); i++)
      {
        Enemy ta=(Enemy)enemies.get(i);
        if ((pX-9) < ta.x + ta.l && (pX+9) > ta.x && ta.y < pY)
        {
          ta.health-=25;
          noStroke();
          fill(255, 255, 120, 180);
          ellipse(pX, ta.y + ta.l*2, 15, 15);
          if (ta.health<=0)
          {
            if (ta.type==3)
            {
              fill(255);
              ellipse((ta.x+ta.l/2), (ta.y+ta.l), ta.l*6.5, ta.l*6.5);
              if ((ta.y-ta.l*2) <= (pY+18) && (ta.y+ta.l*4) >= (pY-18) && (ta.x-ta.l*2.5) <= (pX+15) && (ta.x+ta.l*3.5) >= (pX-15))
              {
                lose=true;
              }
            }
            ta=null;
            enemies.remove(i);
            score+=(int(spd)*10/pCount);
            power+=0.05;
          }
          score++;
        }
      }
    }
    if (power>=4 && power<8)
    {
      for (int i=0; i<enemies.size(); i++)
      {
        Enemy ta=(Enemy)enemies.get(i);
        if ((pX-47) < ta.x + ta.l && (pX-43) > ta.x && ta.y < pY || (pX+43) < ta.x + ta.l && (pX+47) > ta.x && ta.y < pY)
        {
          ta.health-=20;
          noStroke();
          fill(255, 255, 120, 180);
          if (ta.x<(pX-40))
          {
            ellipse(pX-45, ta.y + ta.l*2, 15, 15);
          } else if (ta.x>(pX+40))
          {
            ellipse(pX+45, ta.y + ta.l*2, 15, 15);
          }
          if (ta.health<=0)
          {
            if (ta.type==3)
            {
              fill(255);
              ellipse((ta.x+ta.l/2), (ta.y+ta.l), ta.l*6.5, ta.l*6.5);
              if ((ta.y-ta.l*2) <= (pY+18) && (ta.y+ta.l*4) >= (pY-18) && (ta.x-ta.l*2.5) <= (pX+15) && (ta.x+ta.l*3.5) >= (pX-15))
              {
                lose=true;
              }
            }
            ta=null;
            enemies.remove(i);
            score+=(int(spd)*10/pCount);
            power+=0.05;
          }
          score++;
        }
      }
    }
    if (power>=8)
    {
      for (int i=0; i<enemies.size(); i++)
      {
        Enemy ta=(Enemy)enemies.get(i);
        if ((pX-72) < ta.x + ta.l && (pX-48) > ta.x && ta.y < pY || (pX+48) < ta.x + ta.l && (pX+72) > ta.x && ta.y < pY || (pX-15) < ta.x + ta.l && (pX+15) > ta.x && ta.y < pY)
        {
          if ((pX-72) < ta.x + ta.l && (pX-48) > ta.x && ta.y < pY || (pX+48) < ta.x + ta.l && (pX+72) > ta.x && ta.y < pY)
          {
            ta.health-=20;
          } else if ((pX-15) < ta.x + ta.l && (pX+15) > ta.x && ta.y < pY)
          {
            ta.health-=30;
          }
          noStroke();
          fill(255, 255, 120, 180);
          if (ta.x<(pX-65))
          {
            ellipse(pX-55, ta.y + ta.l*2, 15, 15);
          } else if (ta.x>(pX+65))
          {
            ellipse(pX+55, ta.y + ta.l*2, 15, 15);
          }
          if (ta.health<=0)
          {
            if (ta.type==3)
            {
              fill(255);
              ellipse((ta.x+ta.l/2), (ta.y+ta.l), ta.l*6.5, ta.l*6.5);
              if ((ta.y-ta.l*2) <= (pY+18) && (ta.y+ta.l*4) >= (pY-18) && (ta.x-ta.l*2.5) <= (pX+15) && (ta.x+ta.l*3.5) >= (pX-15))
              {
                lose=true;
              }
            }
            ta=null;
            enemies.remove(i);
            score+=(int(spd)*10/pCount);
            power+=0.05;
          }
          score++;
        }
      }
    }
  }
}
