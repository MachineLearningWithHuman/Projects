<h1>90 Days of portfolio projects in IIT ROORKEE</h1>
<h1>Basic Of Neural Network </h1>
<li>It is nothing but neuron's connected with each others with activation units just to introduce non-linearity into the system</li>
<li>structure of neural network: input unit > hidden unit > output unit</li>
<li>it can be applied into supervised learning system(online ads) as well as unsupervised learning system(embedding generation)</li>
<h3>Why deep learning taking hipe?</h3>
<li>Data(huge data generation) computation(hardware) algorithm(deep nn)</li>
<h2>Binary Classification</h2>
<li>task is to finding probalities of the classes </li>
<li>use sigmoid function <a href="https://en.wikipedia.org/wiki/Sigmoid_function#:~:text=A%20sigmoid%20function%20is%20a,given%20in%20the%20Examples%20section.">visit here</a></li>
<li>for sigmoid function flattening happens at the edge that means for very large values</li>
<h3>Cost function of logistic regression</h3>
<li>loss = -(y* log(y^) + (1-y)*(1-log(1-y^)))/m all meanings are valid</li>
<li>gradient descent is nothing but finding optimal value </li>
<li>learn more here <a href="https://www.coursera.org/learn/neural-networks-deep-learning/lecture/A0tBd/gradient-descent">here</a></li>
<li>partial derivative of gate/gratuation level math is used to implement it . </li>
<li>key thing to remember most of the people will brag about gradient vanishing and exploding bla bla which is nothing but chain rule of partial difference (dy/dz)*(dz/dx) and if one of the value becomes zero or inf the whole thing becoms the same.</li>
<li>logistic gradient decent dl/dz</li>
<li>dl/dz = (dl/da)*(da/dz)</li>
<li>dl/da=a-y/a(1-a)</li>
<li>da/dz=a(1-a)</li>
<li>a-y is the result</li>
<h2>Vectorization and broadcasting in python</h2>
<li>visit the vectorization demo.ipython</li>
<h2>Implementation of Logistic Regression</h2>
<li>visit logistic_scratch.ipython</li>
<h2>Activation Function</h2>
<li>ReLu:max(0,x)</li>
<li>sigmoid:(0,1)</li>
<li>tanh(-1,1)</li>
<li>required to introduce non linearity</li>
<li>if your output function is binary choose sigmoid </li>
<li>for other cases use relu </li>
<li>sigmoid: smooth,binary,clear but vanishing gradient and computation is too expensive</li>
<li>tanh: zero centered</li>
<li>ReLu: computetion effective , dying relu problem</li>
<li>swish: Swish is a new, self-gated activation function discovered by researchers at Google.</li>
<li>learn more here <a href="https://missinglink.ai/guides/neural-network-concepts/7-types-neural-network-activation-functions-right/">here</a></li>
<li>derivative of sigmoid(a) is a(1-a)</li>
<li>derivative of tanh(a) is 1-a^2</li>
<li>for implementation of neural net from scratch use planar data </li>
<li>verify my certificate <a href="https://www.coursera.org/account/accomplishments/certificate/9JK3GSLS8MDA">here</a></li>
<li>Now just add layers into it to make it deep neural network</li>
<li>two other python notrebooks also provides for deep neural network</li>
<h1>Congratulatons</h1>





























