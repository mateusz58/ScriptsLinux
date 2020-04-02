## Example call: bash AddJavaScriptInterviewQuestion.sh "[check]" "(check2)"
echo '*' "$1""$2" >>"/media/sdb1/Google drive/Projects_programming/JavaScript/JavaScriptInterviewQuestions/README.md";

cd "/media/sdb1/Google drive/Projects_programming/JavaScript/JavaScriptInterviewQuestions/"  &&   git pull origin master; git commit -am "Commit";  git push -f origin master
 
