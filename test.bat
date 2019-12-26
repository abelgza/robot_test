@ECHO OFF
docker run -i --security-opt seccomp=chrome.json --shm-size=1gb  -v "C:\Program Files (x86)\Jenkins\workspace\robot_framework\robot_demo":/robot robot-docker:latest robot TestRobot.robot
