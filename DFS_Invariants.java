import java.util.*;

public class DFS_Invariants
{

    private static class Entry 
    {
        private int degrees[];
        private int numVars, degree;

        public Entry(int numVars)
        {
            this.numVars = numVars;
            degrees = new int[numVars];
            for (int i = 0; i < numVars; i++) degrees[i] = 0;
            degree = 999999;
        }

        public int getNumVars()
        {
            return numVars;
        }

        public int getDegree()
        {
            return degree;
        }

        public int[] getDegrees()
        {
            return degrees.clone();
        }

        public void setDegrees(int[] newDegrees)
        {
            degree = 0;

            for (int i = 0; i < numVars; i++) 
            {
                degrees[i] = newDegrees[i];
                degree += newDegrees[i];
            }
        }

        public boolean equals(Object object)
        {
            if (object == null || !(object instanceof Entry)) return false;
            Entry other = (Entry) object;
            if (this.getDegree() != other.getDegree()) return false;

            int[] thisDeg = this.getDegrees(), otherDeg = other.getDegrees();
            for (int i = 0; i < numVars; i++)
            {
                if (thisDeg[i] != otherDeg[i]) return false;
            }
            return true;
            
        }

        public String toString()
        {
            String out = "" + degree + " ";
            out += degrees[0];

            for (int i = 1; i < numVars; i++) 
            {
                out += ", " + degrees[i];
            }
            return out;
        }

    }

    public static Entry addEntries(Entry a, Entry b)
    {
        int numVars = a.getNumVars();
        Entry total = new Entry(numVars);
        int degrees[] = new int[numVars];
        for (int i = 0; i < numVars; i++)
        {
            degrees[i] = a.getDegrees()[i] + b.getDegrees()[i];
        }
        total.setDegrees(degrees);
        return total;
    }

    public static int d1 = 5, d2 = 5, numVars = 3;

    public static ArrayList<Entry> invariants = new ArrayList<Entry>();
    public static int weights[][] = {{1,0,1},{0,1,1}};

    public static void dfs(Entry prev, int[] coords)
    {
        for (int i = 0; i < numVars; i++)
        {
            int x = coords[0] + weights[0][i];
            int y = coords[1] + weights[1][i];

            x %= d1;
            y %= d2;

            Entry e = new Entry(numVars);
            int degrees[] = new int[numVars];
            degrees[i] = 1;
            e.setDegrees(degrees);

            Entry newEntry = addEntries(prev,e);


            if (newEntry.getDegree() < 10 && (x != 0 || y != 0))
            {
                int newCoords[] = {x,y};
                dfs(newEntry,newCoords);
            }


            if (x == 0 && y == 0 && newEntry.getDegree() < 10)
            {

                
                if (!invariants.contains(newEntry))
                {
                    invariants.add(newEntry);
                    System.out.println(newEntry);
                }

            }

        }
    }

    public static void main(String[] args) {
        Entry dp[][];

        dp = new Entry[d1][d2];
        for (int i = 0; i < d1; i++)
        {
            for (int j = 0; j < d2; j++) 
            {
                dp[i][j] = new Entry(numVars);
            }
        }
        int initializeDegrees[] = {0,0,0};
        dp[0][0].setDegrees(initializeDegrees);



        Entry start = new Entry(numVars);
        start.setDegrees(initializeDegrees);
        int startCoords[] = {0,0};

        dfs(start, startCoords);




        return;
    }
}
