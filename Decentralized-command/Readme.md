The Summit is controlled in differential mode according to the manufacturer, i.e. having only two wheels together on one side to form a single wheel during programming. This can be seen in the grouping of wheels in the robot control.yaml file of summit xl control responsible for defining the robot configuration.

With this differential mode, the two left/right wheels will always receive equal speed instructions. Therefore, if there is a malfunction on one of the motors, the controller will not be able to adapt and ensure the correct follow-up of the requested mission.
In such a mode of operation, the elaboration of a fault tolerant control is not valid. Hence the need to switch to a 4×4 operating mode.
To achieve this change, it is necessary to make changes to the configuration and controllers in the launch files, specifying the PID gain and the nature of the controller (torque-force in this case). In the Summit xl control.launch file of the program, the modification will be at the level of the controller spawner, by eliminating the basic argument differential control and adding 4 arguments of each wheel, as well as changing the configuration of the articulations controller. This final pass and the precision of the PID controllers are presented.
The result can be visualized in the Gazebo simulator by the rotation of each wheel separately seen according to the imposed command frw, flw, brw, blw of std msgs/Float64 nature.

![Screenshot from 2022-03-21 15-40-24](https://user-images.githubusercontent.com/36966005/159285025-3f0e18b1-81a1-4c52-8b28-3755e819c418.png)
