class Enemy
{
  public int x;
  public int y;
  public int l;
  int type;
  int fullhealth;
  int health;
  public int atkTime;
  float speed;
  float ispeed;
  Enemy(int newx, int newl, float pspeed, int life)
  {
    x=newx;
    l=newl;
    speed=pspeed;
    ispeed=speed;
    type=life-difUP;
    fullhealth=life*l;
    health=fullhealth;
    atkTime=30;
  }
  void move()
  {
    y+=speed;
    if (type == 1)
    {
      y+=speed*2.5;
    }
    if (type == 3)
    {
      if (y<=30)
      {
        speed=ispeed;
      }
      speed+=0.1;
    }
  }
  void display()
  {
    if (type == 1)
    {
      image(enemyA, x, y, l, 2*l);
    }
    if (type == 2)
    {
      image(enemyB, x, y, l, 2*l);
      atkTime-=1;
      //set attack for enemy type B
      if(atkTime>=6)
      {
        noStroke();
        fill(255, 255, 0);
        ellipse(x+l/2, y+2*l, l/3, l/3);
      }
      else if (atkTime>=-5 && atkTime<=5)
      {
        stroke(255, 255, 0);
        strokeWeight(4);
        line(x+l/2, y+2*l, x+l/2, 600);
        if (inviFrame<=0)
        {
          if (y <= (pY+18) && (x+l/2)-1 <= (pX+15) && (x+l/2)+1 >= (pX-15))
          {
            lose=true;
          }
        }
      }
      if (y==0)
      {
        atkTime=30;
      }
    }
    if (type == 3)
    {
      image(enemyC, x, y, l, 2*l);
    }
  }
}
void spawn()
{
  if (resFrame<0)
  {
    if (time>=15)
    {
      time=0;
      Enemy ta=new Enemy(int(random(0, 580)), int(random(20, 40)), spd, int((random(1, 4))+difUP));
      enemies.add(ta);
      ta=null;
      dif++;
    }
  }
}
void moveEnemy()
{
  for (int i=0; i<enemies.size(); i++)
  {
    Enemy ta=(Enemy)enemies.get(i);
    ta.move();
    if (ta.type==3 && ta.y+ta.l*2>=600)
    {
      fill(255);
      ellipse((ta.x+ta.l/2), (ta.y+ta.l), ta.l*6.5, ta.l*6.5);
      if ((ta.y-ta.l*2) <= (pY+18) && (ta.y+ta.l*4) >= (pY-18) && (ta.x-ta.l*2.5) <= (pX+15) && (ta.x+ta.l*3.5) >= (pX-15))
      {
        lose=true;
      }
      ta.health=0;
      enemies.remove(i);
    }
    if (ta.y>600)
    {
      ta.y=0;
      ta.x=int(random(40, 560));
    }
    ta=null;
  }
}
