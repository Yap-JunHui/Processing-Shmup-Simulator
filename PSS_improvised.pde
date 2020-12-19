//Referenced from code by Lucas Patrick da Silva
//https://www.openprocessing.org/sketch/199753/
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim a1;
AudioPlayer p1;
Minim a2;
AudioPlayer p2;
Minim a3;
AudioPlayer p3;
Minim a4;
AudioPlayer p4;
PImage sprite;
PImage enemyA;
PImage enemyB;
PImage enemyC;
ArrayList enemies;
ArrayList stars;
int time;
float spd = 1;
int dif = 1;
int lvl = 1;
int pCount=4;
int pCountf=4;
int bCount=3;
int bCountf=3;
int B1=255;
int B2=255;
int B3=255;
int B4=255;
int B5=255;
int B6=255;
int B7=255;
int B8=255;
int B9=255;
int B10=255;
float power;
int inviFrame;
int resFrame;
int onFrame;
int playdur1;
int playdur2;
int score;
int hScore=0;
int pScore;
int pX;
int pY;
int pGain;
int difUP;
boolean menu=true;
boolean shoot;
boolean lose;
boolean ko;


void setup()
{
  size(600, 600);
  smooth(3);
  a1=new Minim(this);
  a2=new Minim(this);
  a3=new Minim(this);
  a4=new Minim(this);
  stars = new ArrayList();
  enemies = new ArrayList();
  lose=false;
  ko=false;
  spd=1;
  dif=1;
  lvl=1;
  pCount=pCountf;
  bCount=bCountf;
  power=1;
  score=0;
  time=0;
  pX=300;
  pY=560;
  pGain=3;
  difUP=0;
  inviFrame=50;
  resFrame=5;
  onFrame=0;
  playdur1=56;
  playdur2=3;
  sprite=loadImage("PlaneD-.jpg");
  enemyA=loadImage("EnemyA.jpg");
  enemyB=loadImage("EnemyB.jpg");
  enemyC=loadImage("EnemyC.jpg");
}
void draw()
{
  background(0);
  frameRate(30);
  resFrame--;
  if (menu)
  {
    mwindow();
  } else if (!ko && !lose)
  {
    difficultyChange();
    spawn();
    moveEnemy();
    atk();
    display();
    checkLoss();
    oneUP();
    if (power>=2 && playdur2>=3 || power>=4 && playdur2>=2 || power>=8 && playdur2>=1)
    {
      p4=a4.loadFile("Explosion+1.mp3");
      p4.play();
      playdur2--;
    }
    textSize(20);
    text("Score:  " + score, 10, 35);
    text("Level:  " + lvl, 260, 25);
    text("Hi-Score:  " + hScore, 420, 35);
    textSize(36);
    text("P:  " + (pCount-1), 20, 200);
    text("B:  " + bCount, 20, 250);
    time++;
    inviFrame--;
    onFrame++;
    playdur1++;
  } else if (ko)
  {
    textSize(48);
    fill(255);
    text("YOU LOSE", 180, 200);
    textSize(24);
    text("SCORE:  " + score, 230, 250);
    textSize(32);
    fill(255, 255, B2);
    text("RESTART", 230, 340);
    fill(255, 255, B3);
    text("MENU", 250, 390);
    pScore=score;
    if (pScore>hScore)
    {
      hScore=pScore;
    }
  }
  shoot=false;
  if (mouseX>230 && mouseX<370 && mouseY>300 && mouseY<340)
  {
    B2=0;
    if (mouseButton == LEFT && ko)
    {
      pCount=pCountf;
      bCount=bCountf;
      setup();
    }
  } else
  {
    B2=255;
  }
  if (mouseX>250 && mouseX<350 && mouseY>360 && mouseY<400)
  {
    B3=0;
    if (mouseButton == LEFT && ko)
    {
      setup();
      menu=true;
    }
  } else
  {
    B3=255;
  }
}
void mousePressed()
{
  if (mouseButton == LEFT && !menu && playdur1>60 && onFrame>5)
  {
    p3=a3.loadFile("sf_laser_18.mp3");
    p3.play();
    playdur1=0;
  }
  if (mouseButton == RIGHT && bCount>0)
  {
    p1=a1.loadFile("Bomb+2.mp3");
    p1.play();
    bCount-=1;
    fill(255);
    rect(0, 0, width, height);
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
            score+=int(spd);
          }
          score++;
        }
      }
    }
  }
}
void difficultyChange()
{
  if ((dif%30) == 0)
  {
    lvl=(dif/30)+1;
    if (spd<8)
    {
      spd=1+(dif/30)/5;
    }
    if (lvl>=10 && (lvl%5)==0 && time==5)
    {
      difUP+=1;
    }
  }
}
void oneUP()
{
  if (score>=2000 && pGain==3 || score>=5000 && pGain==2 || score>=10000 && pGain==1)
  {
    pCount+=1;
    pGain-=1;
  }
}
