void mwindow()
{
  textSize(36);
  fill(255);
  text("PROCESSING SHMUP", 130, 100);
  text("SIMULATOR", 195, 140);
  textSize(28);
  text("PLAYER", 100, 260);
  fill(255, 255, B4);
  text("1", 260, 260);
  fill(255, 255, B5);
  text("2", 310, 260);
  fill(255, 255, B6);
  text("3", 360, 260);
  fill(255, 255, B7);
  text("4", 410, 260);
  fill(255, 255, B8);
  text("5", 460, 260);
  fill(255);
  text("BOMB", 100, 320);
  fill(255, 255, B9);
  text("YES", 300, 320);
  fill(255, 255, B10);
  text("NO", 380, 320);
  fill(255, 255, B1);
  text("START", 260, 460);
  if (mouseX>260 && mouseX<350 && mouseY>430 && mouseY<460)
  {
    B1=0;
    if (mousePressed && mouseButton==LEFT)
    {
      fill(0);
      rect(0, 0, 600, 600);
      menu=false;
    }
  } else
  {
    B1=255;
  }
  //set initial lives
  if ((mouseX>250 && mouseX<280 && mouseY>220 && mouseY<260) || pCount==2)
  {
    B4=0;
    if (mousePressed && mouseButton==LEFT)
    {
      pCount=2;
      pCountf=2;
    }
  } else
  {
    B4=255;
  }
  if ((mouseX>300 && mouseX<330 && mouseY>220 && mouseY<260) || pCount==3)
  {
    B5=0;
    if (mousePressed && mouseButton==LEFT)
    {
      pCount=3;
      pCountf=3;
    }
  } else
  {
    B5=255;
  }
  if ((mouseX>350 && mouseX<380 && mouseY>220 && mouseY<260) || pCount==4)
  {
    B6=0;
    if (mousePressed && mouseButton==LEFT)
    {
      pCount=4;
      pCountf=4;
    }
  } else
  {
    B6=255;
  }
  if ((mouseX>400 && mouseX<430 && mouseY>220 && mouseY<260) || pCount==5)
  {
    B7=0;
    if (mousePressed && mouseButton==LEFT)
    {
      pCount=5;
      pCountf=5;
    }
  } else
  {
    B7=255;
  }
  if ((mouseX>450 && mouseX<480 && mouseY>220 && mouseY<260) || pCount==6)
  {
    B8=0;
    if (mousePressed && mouseButton==LEFT)
    {
      pCount=6;
      pCountf=6;
    }
  } else
  {
    B8=255;
  }
  //set bomb or no
  if ((mouseX>290 && mouseX<350 && mouseY>280 && mouseY<320) || bCount==3)
  {
    B9=0;
    if (mousePressed && mouseButton==LEFT)
    {
      bCount=3;
      bCountf=3;
    }
  } else
  {
    B9=255;
  }
  if ((mouseX>380 && mouseX<430 && mouseY>280 && mouseY<320) || bCount==0)
  {
    B10=0;
    if (mousePressed && mouseButton==LEFT)
    {
      bCount=0;
      bCountf=0;
    }
  } else
  {
    B10=255;
  }
}
