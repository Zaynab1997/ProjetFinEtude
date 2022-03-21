Udacity is a simulation of a car providing user input of steering angle data corresponding to radian values arranged from -1 to 1, speed and acceleration, and images from car-mounted cameras each recording video sequences.

This is the best implementation of convolutional neural network learning to estimate the steering angle based on the images seen.

In order to monitor the operation and movements of the vehicle through the Convolutional Neural Network, the conduction will initially be recorded according to the keyboard keys. Thus, the quality of conduction, initially determines the behaviour of the simulator in au-
tonome mode.

In autonomous mode, the neural network is tested to drive the car alone after collecting the training data on the field, then the performance will be verified by navigation on the same track. A second check is made on the second track with a much rougher ́e terrain consisting of steeper hills. It should be mentioned that the different parts of the track have different textures and different edges and borders (bridge, sand, curves) along the track.

The data collected should respect a conduction as close to the medium as possible. The data is obviously not realistic as in real life, since in reality, a car would be in a left or right lane, not in the middle, but for this project, we aim for a successful neural model that goes down the middle to ensure a balanced data set ́e. Generalising the data, 3 turns of the car in both direct and reverse directions are made. The reason for this is that this track has a left turn bias, which means that when moving forward, the main direction is to the left. This creates a problem for the neural network as it could bias the model to always predict left turns, resulting in the car's tendency to crash to the edges.

The study then requires an analysis of the loss and accuracy graphs. This case generates an example of a type of regression such that the metric error considered is the mean square error. If the means are squared, the error is large on both the training and validation sets, thus presenting an under-fitting problem. The training data is the set of images each of which has a steering angle label.

This helps the network to learn the features of each image and associate each one with a steering angle label.

Whenever there is a straight path, the steering angle is zero, whereas whenever there is a curvature, the steering angle would be negative to denote a left turn and positive to denote a right turn.
This approach of using three camera planes has been proposed by Nvidia, generalising the model by collecting more samples of the same scene and diversifying it and simulating the car in different positions, this model is given in detail.
4.4.4. Data adjustment If a convolutional neural network is built on the basis of these data, the model could become biased towards driving in a straight line all the time. This is solved by flattening the distributions and reducing the samples of distributions whose frequency exceeds 400 (the first two patterns).
With respect to the validation and training data, a proportion of 20% validation and 80% training is used.

To further generalise the data, a set of transformations is applied on some random images from the database and then included in the study. The transformations done are Zoom, Translation, Image Brightness and Flip the image by opposing the sign of the
the sign of the steering angle. It should be mentioned that the model used by Nvidia requires the transformation of the images into YUV form (Luminance Y, Chrominance [U,V]), and cropping them to emphasise the region of interˆet of the image.

Research has shown that the use of Convolutional Neural Networks (CNNs) for time series classification has several important advantages over other methods. They are highly noise resistant models, capable of extracting highly informative deep
They are very noise resistant models, capable of extracting highly informative, time-independent deep features, and are very robust against translation, scaling, rotation, and other image distortions.
Each CNN requires four types of layers to perform the classification:

i. Convolution layer by a series of suitable filters of variable size (3×3, 5×5, . . . ) allowing to extract the characteristics of the image. This convolution is followed by a further processing of the image.

This convolution is followed by an activation function of type either sigmo ̈ıde, or tangent
hyperbolic, or ReLU and its variants (see Appendix B).
ii. Pooling or subsampling layer reducing the dimension of the models obtained by the filters
by the filters thus simplifying the data management.
iii. Flatten" layer consisting of creating a long vector from the recovered data.
iv. Dense" layer fully connected taking as input the obtained vector having only one dimension, in order to try to create any
This layer finally produces as an output the vector with a single dimension, which is then used to create any kind of relationship that may exist between the obtained models.
This layer finally produces as output a number of neurons equal to the number of classes
desired.
b. Nvidia model used
The network used is that of Nvidia since it is powerful in the case of image processing.
This Network consists of the following layers:
1. 5 successive convolution layers of the same mask size (2,2), but of decreasing output size with increasing number of layers
decroissante avec augmentation de nombre de parametres obtenu.
2. The activation function of all convolutional layers is 0ELU0 instead of 0ReLU0 to
0Dead - ReLU0 effect observed degrading the performance of the system.
3. One layer of flatten to switch to one dimension.
4. 4 successive fully connected layers of decreasing number of outputs and parameters until reaching a single output which is the steering angle prediction.
The data is sent to the vehicle via Flask and socket.io on the ip address that the Udacity application occupies. The final result shows that the loss of validation data is higher than that of the test data, which implies that the model is optimal without over-fitting.
