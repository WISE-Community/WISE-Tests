#script to help run cucumber tests
#this script takes in 0 or 1 argument
#the tests we run will be determined by the arugment
#if no argument is provided, we will run all the tests

#get the argument to the script
arg1=$1

#this variable will store the directory path of the tests we want to run
testPath=""

if [ -z "$arg1" ]; then
    #run all tests
    testPath="features"
elif [ "$arg1" == "student" ]; then
    #run student tests
    testPath="features/student_features"
elif [ "$arg1" == "teacher" ]; then
    #run teacher tests
    testPath="features/teacher_features"
elif [ "$arg1" == "admin" ]; then
    #run admin tests
    testPath="features/admin_features"
else
    #run the exact test provided in the argument
    testPath="$arg1"
fi

echo "Running tests in:" $testPath

#run the cucumber tests in the given directory
cucumber $testPath
