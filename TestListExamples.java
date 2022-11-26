import static org.junit.Assert.*;

import java.beans.Transient;

//Addition: importing list stuff
import java.util.ArrayList;
import java.util.List;

import org.junit.*;

class StartsWithCapital implements StringChecker {
  public boolean checkString(String s) {
    if (s.length() > 0) return Character.isUpperCase(s.charAt(0));
    return false;
  }
}

public class TestListExamples {
  // Write your grading tests here!
  @Test(timeout = 2000)
  public void testFilter1() {
    List<String> input1 = new ArrayList<String>();
    input1.add("The");
    input1.add("Quick");
    input1.add("Brown");
    input1.add("Fox");
    input1.add("jumped");
    input1.add("over");
    input1.add("the");
    input1.add("Lazy");
    input1.add("Dog.");
    List<String> expected = new ArrayList<String>();
    expected.add("The");
    expected.add("Quick");
    expected.add("Brown");
    expected.add("Fox");
    expected.add("Lazy");
    expected.add("Dog.");
    assertEquals(expected, ListExamples.filter(input1, new StartsWithCapital()));
  }

  @Test(timeout = 2000)
  public void testFilter2() {
    List<String> input1 = new ArrayList<String>();
    List<String> expected = new ArrayList<String>();
    assertEquals(expected, ListExamples.filter(input1, new StartsWithCapital()));
  }

  @Test(timeout = 2000)
  public void testMerge1() {
    List<String> input1 = new ArrayList<>();
    input1.add("apple");
    input1.add("arch");
    input1.add("car");
    input1.add("zen");
    input1.add("zoo");
    List<String> input2 = new ArrayList<>();
    input2.add("bat");
    input2.add("bronze");
    input2.add("car");
    input2.add("yellow");
    List<String> expected = new ArrayList<>();
    expected.add("apple");
    expected.add("arch");
    expected.add("bat");
    expected.add("bronze");
    expected.add("car");
    expected.add("car");
    expected.add("yellow");
    expected.add("zen");
    expected.add("zoo");
    assertEquals(expected, ListExamples.merge(input1, input2));
  }

  @Test(timeout = 2000)
  public void testMerge2() {
    List<String> input1 = new ArrayList<>();
    List<String> input2 = new ArrayList<>();
    input2.add("bat");
    input2.add("bronze");
    input2.add("car");
    input2.add("yellow");
    List<String> expected = new ArrayList<>();
    expected.add("bat");
    expected.add("bronze");
    expected.add("car");
    expected.add("yellow");
    assertEquals(expected, ListExamples.merge(input1, input2));
  }
}
