CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
RUNPATH="$CPATH org.junit.runner.JUnitCore"

rm -rf student-submission
rm ListExamples.java ListExamples.class TestListExamples.class
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
echo 'ListExamples.java found'
else 
echo 'ListExamples.java not found'
exit
fi
cp student-submission/ListExamples.java ./
javac -cp $CPATH *.java 
if [[ $? -ne 0 ]]
then 
echo 'Compile error'
exit
else 
echo 'Compile success'
fi
java -cp $RUNPATH TestListExamples > results.txt
cat results.txt