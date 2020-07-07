<h1>90 Days of portfolio projects in IIT ROORKEE</h1>
<h1>Tune hyperparameter</h1>
<li>list of hyperparameter: layers,hidden units,learning rate, activation function</li>
<li>train:60% test:20% dev: 20%</li>
<li>for heavy data train:98% test/valid:1</li>
<li>distribution needs to be same </li>
<li>for structural data use bigquerys farmfingerprint function</li>
<h2>Bias and Variance</h2>
<li>variance error > train error : overfit</li>
<li>variance error ~= train error : high bias/underfit</li>
<li>both are high : high bias and high variance</li>
<li>both are low: both are low</li>
<li>you cannot acheive more accuracy than baysian optimum error </li>
<li>high bias: bigger network, train longer</li>
<li>high variance: more data, regularization</li>
<li><a href="https://ml-cheatsheet.readthedocs.io/en/latest/regularization.html">visit for regularization</a></li>
<li>l1 supress the less important information while l2 keeps them closer to zero and elastic net is a combination of the above two other regularization methods are dropout,data agumentation, early stopping, ensemble, cross validation,noise injection</li>
<li>due to regularization every layers will be roughly linear due to lambda</li>
<li>dropout applies at training network only</li>
<li>vanishing gradient have to keep in mind</li>
<li>In logistic regression you can initiate your weights as zero but in case of neural network it is not the case</li>
<li>use np.random.randn(shape)*initializer</li>
<li><a href="https://www.wandb.com/articles/the-effects-of-weight-initialization-on-neural-nets#:~:text=Different%20weight%20initialization%20schemes&text=Weights%20initialized%20with%20values%20sampled,distribution%20with%20a%20careful%20tweak">how weight initializer affects accuracy</a></li>
<li>gradient checking to see your learning</li>
<li>gradient decent doesnt work with dropout</li>
<h2>Optimization Techniques</h2>
<li>mini batches: make batches of some value shuffle the data and do backprop</li>
<li>batch geadient: smooth mini batch:noisy </li>
<li>if m = 1 stochastic gradient descent,every example is a mini batch,extreme case</li>
<li>batch will take large step to converge , stochastic will be noisy never gonna converg occolate in between </li>
<li>mini batches:noise can  be avoided using smaller learning rate</li>
<li>mini batches must be smaller than memory size best:64,128,256,512</li>
<li>exponential avgrage: less memory </li>
<li>bias correction: initial days prediction will be inaccurate due to less value</li>
<li>to solve it divide by 1-B^t</li>
<li>gradient decent with momentum: if you see you don't need vertical gradient you need horizontal gradientto converg</li>
<li><a href="https://www.coursera.org/learn/deep-neural-network/lecture/BhJlm/rmsprop">see rms prop here</a></li>
<li>adam is rmsprop + momentum</li>
<li>learning rate decay: minibatch case</li>
<li>learning rate: learning rate *(1/(1+epoch*decay rate))</li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>




















