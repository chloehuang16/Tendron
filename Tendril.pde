public class Tendril {
    public final static int SEG_LENGTH = 3;
    private int myNumSegments, myX, myY;
    color pigment;
    private double myAngle;
    public Tendril(int len, double theta, int x, int y, color lineColor) {
        myAngle = theta;
        myX = x;
        myY = y;
        myNumSegments = len;
        pigment = lineColor;
    }
    public void show() {
        int startX = myX;
        int startY = myY;
        stroke((int)(Math.random()*255),0,0);
        for (int i = 0; i < myNumSegments; i++) {
            myAngle += Math.random() * 0.4 - 0.2;
            int endX = startX + (int)(Math.cos(myAngle) * SEG_LENGTH);
            int endY = startY + (int)(Math.sin(myAngle) * SEG_LENGTH);
            line(startX, startY, endX, endY);
            startX = endX;
            startY = endY;
        }
        if (myNumSegments < 6) {
            return;
        } 
        else {
            new Cluster(myNumSegments/3, startX, startY);
        }
    }
}
