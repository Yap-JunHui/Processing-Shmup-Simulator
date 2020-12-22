class Star
{
  int x;
  int y;
  int speed;
  Star(int newx, int newy, int pspeed)
  {
    x=newx;
    y=newy;
    speed=pspeed;
  }
  void move()
  {
    y+=speed;
  }
  void display()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 2, 2);
  }
}
void display()
{
  if (resFrame<0)
  {
    for (int i=0; i<enemies.size(); i++)
    {
      Enemy ta=(Enemy)enemies.get(i);
      ta.display();
      ta=null;
    }
    fill(255);
    image(sprite, pX-20, pY-20, 40, 40);
    if (onFrame>=20 && mouseX>=(-10) && mouseX<=width+10 && mouseY>=(-10) && mouseY<=height+10)
    {
      pX=mouseX;
      pY=mouseY;
    }
    if (shoot)
    {
      if (power>=1 && power<2)
      {
        stroke(255);
        strokeWeight(1);
        line(pX, 0, pX, pY-20);
        fill(255);
        ellipse(pX, pY-22, 8, 8);
      }
      if (power>=2 && power<4)
      {
        stroke(255);
        strokeWeight(2);
        line(pX-3, 0, pX-3, pY-25);
        line(pX+3, 0, pX+3, pY-25);
        line(pX-8, 0, pX-8, pY-25);
        line(pX+8, 0, pX+8, pY-25);
        fill(255);
        ellipse(pX, pY-25, 25, 25);
      }
      if (power>=4 && power<8)
      {
        noStroke();
        fill(255);
        ellipse(pX-45, pY, 20, 20);
        ellipse(pX+45, pY, 20, 20);
        stroke(255);
        strokeWeight(4);
        line(pX-45, 0, pX-45, pY);
        line(pX+45, 0, pX+45, pY);
      }
      if (power>=8)
      {
        stroke(245, 245, 0);
        strokeWeight(2);
        fill(255, 240);
        rect(pX-15, 0, 30, pY-15);
        fill(255);
        ellipse(pX-50, pY, 20, 20);
        ellipse(pX+50, pY, 20, 20);
        ellipse(pX-70, pY, 20, 20);
        ellipse(pX+70, pY, 20, 20);
        stroke(255);
        strokeWeight(4);
        line(pX-50, 0, pX-50, pY);
        line(pX+50, 0, pX+50, pY);
        line(pX-70, 0, pX-70, pY);
        line(pX+70, 0, pX+70, pY);
      }
    }
    if (time%2==0)
    {
      Star ta=new Star(int(random(10, 590)), int(random(5, 10)), int(random(35, 50)));
      stars.add(ta);
      ta=null;
    }
    for (int i=0; i<stars.size(); i++)
    {
      Star ta=(Star)stars.get(i);
      ta.display();
      ta.move();
      if (ta.y>600)
      {
        stars.remove(i);
      }
      ta=null;
    }
  }
}
