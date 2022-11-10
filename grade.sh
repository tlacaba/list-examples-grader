# Create your grading script here

# set -e # Gotta comment this out since we want errors to be displayed

CPATH = ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

cp TestListExamples.java student-submission/
cd student-submission/

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples