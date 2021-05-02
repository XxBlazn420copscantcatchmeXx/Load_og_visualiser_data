import java.util.Comparator;

class AreaComparator implements Comparator<State> {
  public int compare(State c1, State c2) {
    return Integer.compare(c1.getArea(), c2.getArea());
  }
}
