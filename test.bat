@ECHO OFF
docker run -i --security-opt seccomp=chrome.json --shm-size=1gb  -v "%cd%:/robot" robot-docker:latest robot TestRobot.robot
