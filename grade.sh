# Create your grading script here

# set -e # Gotta comment this out since we want errors to be displayed

echo ""

CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

if ! [[ -e student-submission ]]
then
	mkdir student-submission
else
	rm -rf student-submission
	mkdir student-submission
fi

git clone $1 student-submission

echo ""

if ! [[ -f student-submission/ListExamples.java ]]
then
    	echo "ListExamples.java not found in student submission. 0/4 points."
    	exit
fi

cp TestListExamples.java student-submission/
cp -r lib student-submission/

cd student-submission/

echo "===== COMPILING... ====="
echo ""

javac ListExamples.java > output.txt 2> error.txt
if [[ $? != 0 ]]
then
	cat error.txt
    echo ""
    echo "ListExamples.java did not compile. 0/4 points."
	exit
fi

javac -cp $CPATH *.java > output.txt 2> error.txt
if [[ $? != 0 ]]
then
    cat error.txt
    echo ""
    echo "TestListExamples.java did not compile. It is possible that an issue in ListExamples.java caused the issue. If you find that this is not the case, contact a TA."
    echo "0/4 points."
    exit
fi

echo "===== RUNNING... ====="
echo ""

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt 2> error.txt

if grep -q "OK (4 tests)" output.txt
then
    echo "All tests passed! 4/4 points."
else
    cat output.txt
    FAILURES=`grep -c "(TestListExamples)" output.txt`
    PASSES=$((4 - $FAILURES))
    echo "Test(s) failed! $PASSES/4 points."
fi