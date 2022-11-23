GREEN='\033[1;32m'
RED='\033[0;31m'


echo "${GREEN}========================Flutter Metric Start======================="
RESULT=""

if hash fvm 2>/dev/null; then
  echo "Using fvm flutter version"
  RESULT=$(fvm flutter pub run dart_code_metrics:metrics analyze --fatal-style --fatal-performance --fatal-warnings --reporter=gitlab lib > code-quality-report.json)
else
  echo "Using local flutter version"
  RESULT=$(flutter pub run dart_code_metrics:metrics analyze --fatal-style --fatal-performance --fatal-warnings --reporter=gitlab lib > code-quality-report.json)
fi

if [[ $RESULT == *"PERFORMANCE"* ]] || [[ $RESULT == *"WARNING"* ]] || [[ $RESULT == *"STYLE"* ]]; then
    echo "${RED}----> Some files have code metric fatal errors, check Dart Code metric"
    exit 1
else
    echo "----> All code metrics are good :)"
fi
echo "${GREEN}========================Flutter Metric Finish======================="
