# Create your grading script here

# set -e # Gotta comment this out since we want errors to be displayed

CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

if ! [[ -e student-submission ]]
then
	mkdir student-submission
else
	rm -rf student-submission
	mkdir student-submission
fi

git clone $1 student-submission

if ! [[ -f student-submission/ListExamples.java ]]
then
    	echo "ListExamples.java not found in student submission. 0 points."
    	exit
fi

cp TestListExamples.java student-submission/
cp -r lib student-submission/

cd student-submission/

javac ListExamples.java > output.txt 2> error.txt
if [[ $? != 0 ]]
then
	echo "ListExamples.java did not compile. 0 points."
	exit
fi

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt 2> error.txt
